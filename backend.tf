terraform {
  backend "remote" {
    organization = "Architech-Digital-Platform"

    workspaces {
      name = "terraform-azurerm-storage-account"
    }
  }
}