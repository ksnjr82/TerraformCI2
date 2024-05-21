terraform {
  required_version = ">=1.9.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.43.0"

    }
  }
}
terraform {
  cloud {
    organization = "EZTestOrg"

    workspaces {
      name = "TerraformCI"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}
resource "azurerm_resource_group" "rg" {
  name     = "TestWebAppRG"
  location = "East US"
}
resource "azurerm_storage_account" "storage12" {
  name                     = "ezstrge1"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "RAGRS"

}
 #adding comment to make commit
