#Azure Storage Account Module
resource "azurerm_storage_account" "storage" {
  name                      = format("adp%s%s", var.environment, var.storage_name)
  resource_group_name       = var.resource_group_name
  location                  = var.location
  account_kind              = var.account_kind
  account_tier              = var.account_tier
  account_replication_type  = var.account_replication_type
  access_tier               = var.access_tier
  enable_https_traffic_only = var.enable_https_traffic_only
  min_tls_version           = var.min_tls_version
  allow_blob_public_access  = var.allow_blob_public_access

  blob_properties {
    delete_retention_policy {
      days = var.soft_delete_retention
    }
    dynamic "cors_rule" {
      for_each = var.cors_rule
      content {
        allowed_origins    = cors_rule.value.allowed_origins
        allowed_methods    = cors_rule.value.allowed_methods
        allowed_headers    = cors_rule.value.allowed_headersgit
        exposed_headers    = cors_rule.value.exposed_headers
        max_age_in_seconds = cors_rule.value.max_age_in_seconds
      }
    }
  }

  dynamic "custom_domain" {
    for_each = var.custom_domain != null ? [1] : []
    content {
      name          = var.custom_domain.name
      use_subdomain = var.custom_domain.use_subdomain
    }
  }

  dynamic "static_website" {
    for_each = var.static_website != null ? [1] : []
    content {
      index_document     = var.static_website.index_document
      error_404_document = var.static_website.error_404_document
    }
  }

  dynamic "network_rules" {
    for_each = var.network_rules != null ? [1] : []
    content {
      default_action             = var.network_rules.default_action
      ip_rules                   = var.network_rules.ip_rules
      virtual_network_subnet_ids = var.network_rules.subnet_ids
      bypass                     = var.network_rules.bypass
    }
  }

  tags = var.tags
}

resource "azurerm_advanced_threat_protection" "threat_protection" {
  count              = var.enable_advanced_threat_protection ? 1 : 0
  target_resource_id = azurerm_storage_account.storage.id
  enabled            = var.enable_advanced_threat_protection
}

resource "azurerm_storage_container" "storage_container" {
  count                 = length(var.containers)
  name                  = var.containers[count.index].name
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = var.containers[count.index].access_type
}

resource "azurerm_storage_management_policy" "storage_mgmt_policy" {
  count = length(var.lifecycles) == 0 ? 0 : 1

  storage_account_id = azurerm_storage_account.storage.id

  dynamic "rule" {
    for_each = var.lifecycles
    iterator = rule
    content {
      name    = "rule${rule.key}"
      enabled = true
      filters {
        prefix_match = rule.value.prefix_match
        blob_types   = ["blockBlob"]
      }
      actions {
        base_blob {
          delete_after_days_since_modification_greater_than = rule.value.delete_after_days
        }
      }
    }
  }
}
