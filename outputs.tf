
output "id" {
  description = "Id of the storage account created."
  value       = azurerm_storage_account.storage.id
  sensitive   = true
}

output "name" {
  description = "Name of the storage account created."
  value       = azurerm_storage_account.storage.name
}

output "primary_access_key" {
  description = "The primary access key for the storage account."
  value       = azurerm_storage_account.storage.primary_access_key
  sensitive   = true
}

output "secondary_access_key" {
  description = "The secondary access key for the storage account."
  value       = azurerm_storage_account.storage.secondary_access_key
  sensitive   = true
}

output "primary_blob_endpoint" {
  description = "The endpoint URL for blob storage in the primary location."
  value       = azurerm_storage_account.storage.primary_blob_endpoint
}

output "primary_blob_host" {
  description = "The hostname with port if applicable for blob storage in the primary location."
  value       = azurerm_storage_account.storage.primary_blob_host
}

output "secondary_blob_endpoint" {
  description = "The endpoint URL for blob storage in the secondary location."
  value       = azurerm_storage_account.storage.secondary_blob_endpoint
}

output "secondary_blob_host" {
  description = "The hostname with port if applicable for blob storage in the secondary location."
  value       = azurerm_storage_account.storage.secondary_blob_host
}
