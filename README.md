# terraform-azurerm-storage-account

## Create a storage account in Azure

Module to create an Azure storage account with set of containers (and access level). It is recommended to set the network policies to restrict access to account. For more details please see: 

- [Azure documentation](https://docs.microsoft.com/en-us/azure/storage/)

# Module details

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.2  |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_advanced_threat_protection.threat_protection](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/advanced_threat_protection) | resource |
| [azurerm_storage_account.storage](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_container.storage](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |
| [azurerm_storage_management_policy.storage](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_management_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_tier"></a> [access\_tier](#input\_access\_tier) | Defines the access tier for BlobStorage and StorageV2 accounts. Valid options are Hot and Cool. | `string` | `"Hot"` | no |
| <a name="input_account_kind"></a> [account\_kind](#input\_account\_kind) | Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. Changing this forces a new resource to be create | `string` | `"StorageV2"` | no |
| <a name="input_account_replication_type"></a> [account\_replication\_type](#input\_account\_replication\_type) | Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS. | `string` | `"ZRS"` | no |
| <a name="input_account_tier"></a> [account\_tier](#input\_account\_tier) | Defines the Tier to use for this storage account. Valid options are Standard and Premium. Changing this forces a new resource to be created. | `string` | `"Standard"` | no |
| <a name="input_allow_blob_public_access"></a> [allow\_blob\_public\_access](#input\_allow\_blob\_public\_access) | Allow or disallow public access to all blobs or containers in the storage account. Defaults to false. | `bool` | `false` | no |
| <a name="input_containers"></a> [containers](#input\_containers) | List of containers to create and their access levels. | <pre>list(object({<br>    name        = string,<br>    access_type = string<br>  }))</pre> | `[]` | no |
| <a name="input_cors_rule"></a> [cors\_rule](#input\_cors\_rule) | CORS rules for storage account. | <pre>list(object({<br>    allowed_origins    = list(string),<br>    allowed_methods    = list(string),<br>    allowed_headers    = list(string),<br>    exposed_headers    = list(string),<br>    max_age_in_seconds = number<br>  }))</pre> | `[]` | no |
| <a name="input_custom_domain"></a> [custom\_domain](#input\_custom\_domain) | The Custom Domain Name to use for the Storage Account, which will be validated by Azure. | <pre>object({<br>    name          = string,<br>    use_subdomain = bool<br>  })</pre> | `null` | no |
| <a name="input_enable_advanced_threat_protection"></a> [enable\_advanced\_threat\_protection](#input\_enable\_advanced\_threat\_protection) | Boolean flag which controls if advanced threat protection is enabled. | `bool` | `false` | no |
| <a name="input_enable_https_traffic_only"></a> [enable\_https\_traffic\_only](#input\_enable\_https\_traffic\_only) | Boolean flag which forces HTTPS if enabled. | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Specifies the environment of the storage account | `string` | n/a | yes |
| <a name="input_lifecycles"></a> [lifecycles](#input\_lifecycles) | List of lifecycle delete | <pre>list(object({<br>    prefix_match      = set(string),<br>    delete_after_days = number<br>  }))</pre> | `[]` | no |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_min_tls_version"></a> [min\_tls\_version](#input\_min\_tls\_version) | The minimum supported TLS version for the storage account. Possible values are TLS1\_0, TLS1\_1, and TLS1\_2. Defaults to TLS1\_0 for new storage accounts. | `string` | `"TLS1_0"` | no |
| <a name="input_network_rules"></a> [network\_rules](#input\_network\_rules) | Network rules restricting access to the storage account. | <pre>object({<br>    default_action = string<br>    ip_rules       = list(string),<br>    subnet_ids     = list(string),<br>    bypass         = list(string)<br>  })</pre> | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | This will tell us to which resource group we need to deploy the resources of this module | `string` | n/a | yes |
| <a name="input_soft_delete_retention"></a> [soft\_delete\_retention](#input\_soft\_delete\_retention) | Specifies the number of days that the blob should be retained, between 1 and 365 days. Defaults to 7. | `number` | `7` | no |
| <a name="input_static_website"></a> [static\_website](#input\_static\_website) | The webpage that Azure Storage serves for requests to the root of a website or any subfolder | <pre>object({<br>    index_document     = string,<br>    error_404_document = string<br>  })</pre> | `null` | no |
| <a name="input_storage_name"></a> [storage\_name](#input\_storage\_name) | Name of storage account | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to associate with storage account | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Id of the storage account created. |
| <a name="output_name"></a> [name](#output\_name) | Name of the storage account created. |
| <a name="output_primary_access_key"></a> [primary\_access\_key](#output\_primary\_access\_key) | The primary access key for the storage account. |
| <a name="output_primary_blob_endpoint"></a> [primary\_blob\_endpoint](#output\_primary\_blob\_endpoint) | The endpoint URL for blob storage in the primary location. |
| <a name="output_primary_blob_host"></a> [primary\_blob\_host](#output\_primary\_blob\_host) | The hostname with port if applicable for blob storage in the primary location. |
| <a name="output_secondary_access_key"></a> [secondary\_access\_key](#output\_secondary\_access\_key) | The secondary access key for the storage account. |
| <a name="output_secondary_blob_endpoint"></a> [secondary\_blob\_endpoint](#output\_secondary\_blob\_endpoint) | The endpoint URL for blob storage in the secondary location. |
| <a name="output_secondary_blob_host"></a> [secondary\_blob\_host](#output\_secondary\_blob\_host) | The hostname with port if applicable for blob storage in the secondary location. |

# Usage example 

## Basic 
```
module "storage-account" {
  source  = "app.terraform.io/storage-account/azurerm"
  version = "0.0.1"

  storage_name        = "websitefiles"
  environment         = "dev"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  min_tls_version     = "TLS1_2"
  containers = [
    {
      name        = "container"
      access_type = "private"
    },
  ]

  cors_rule = [
    {
    allowed_origins    = ["https://myhost.com"]
    allowed_methods    = ["GET", "OPTIONS"]
    allowed_headers    = ["*"]
    exposed_headers    = ["*"]
    max_age_in_seconds = 200
    },
  ]

  lifecycles = [
    {
      prefix_match      = ["container/path"]
      delete_after_days = 2
    },
    {
      prefix_match      = ["container/another_path"]
      delete_after_days = 5
    }
  ]

  tags = var.tags
}
```