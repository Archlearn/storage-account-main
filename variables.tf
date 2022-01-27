variable "environment" {
  type        = string
  description = "Specifies the environment of the storage account"

  validation {
    condition     = contains(["sanbox", "dev", "qa", "preprod", "prod"], var.environment)
    error_message = "The environment must be one of the specified values sandbox, dev, qa, preprod, prod."
  }
}

variable "resource_group_name" {
  type        = string
  description = "This will tell us to which resource group we need to deploy the resources of this module"
}

variable "location" {
  type        = string
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "storage_name" {
  description = "Name of the storage account"
  type        = string
}

variable "account_kind" {
  description = "Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. Changing this forces a new resource to be create"
  type        = string
  default     = "StorageV2"
}

variable "account_tier" {
  description = "Defines the Tier to use for this storage account. Valid options are Standard and Premium. Changing this forces a new resource to be created."
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS."
  type        = string
  default     = "ZRS"
}

variable "access_tier" {
  description = "Defines the access tier for BlobStorage and StorageV2 accounts. Valid options are Hot and Cool."
  type        = string
  default     = "Hot"
}

variable "enable_https_traffic_only" {
  description = "Boolean flag which forces HTTPS if enabled."
  type        = bool
  default     = true
}

variable "min_tls_version" {
  description = "The minimum supported TLS version for the storage account. Possible values are TLS1_0, TLS1_1, and TLS1_2. Defaults to TLS1_0 for new storage accounts."
  type        = string
  default     = "TLS1_0"
}

variable "allow_blob_public_access" {
  description = "Allow or disallow public access to all blobs or containers in the storage account. Defaults to false."
  type        = bool
  default     = false
}

variable "soft_delete_retention" {
  description = "Specifies the number of days that the blob should be retained, between 1 and 365 days. Defaults to 7."
  type        = number
  default     = 7
}

variable "cors_rule" {
  description = "CORS rules for storage account."
  type = list(object({
    allowed_origins    = list(string),
    allowed_methods    = list(string),
    allowed_headers    = list(string),
    exposed_headers    = list(string),
    max_age_in_seconds = number
  }))
  default = []
}

variable "enable_advanced_threat_protection" {
  description = "Boolean flag which controls if advanced threat protection is enabled."
  type        = bool
  default     = false
}

variable "network_rules" {
  description = "Network rules restricting access to the storage account."
  type = object({
    default_action = string
    ip_rules       = list(string),
    subnet_ids     = list(string),
    bypass         = list(string)
  })
  default = null
}

variable "containers" {
  description = "List of containers to create and their access levels."
  type = list(object({
    name        = string,
    access_type = string
  }))
  default = []
}

variable "custom_domain" {
  description = "The Custom Domain Name to use for the Storage Account, which will be validated by Azure."
  type = object({
    name          = string,
    use_subdomain = bool
  })
  default = null
}

variable "static_website" {
  description = "The webpage that Azure Storage serves for requests to the root of a website or any subfolder"
  type = object({
    index_document     = string,
    error_404_document = string
  })
  default = null
}

variable "lifecycles" {
  description = "List of lifecycle delete"
  type = list(object({
    prefix_match      = set(string),
    delete_after_days = number
  }))
  default = []
}

variable "tags" {
  description = "Tags to associate with storage account"
  type        = map(string)
  default     = {}
}

variable "ARM_TENANT_ID" {
  description = "Specifies Azure Active Directory Tenant ID"
  type        = string
  default     = ""
}

variable "ARM_CLIENT_SECRET" {
  description = "Specifies registered application's service principal secret value for authentication"
  type        = string
  default     = ""
}

variable "ARM_CLIENT_ID" {
  description = "Specifies the application ID for authentication."
  type        = string
  default     = ""
}

variable "ARM_SUBSCRIPTION_ID" {
  description = "Specifies the subscription ID in which the resources are created."
  type        = string
  default     = ""
}