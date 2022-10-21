terraform {
    required_providers {
      azurerm = {
        source = "hashicorp/azurerm"
        version = "~> 3.0.2"
      } 
    }    
  required_version = ">= 1.1.0"
}
provider "azurerm" {
    features {}
}
resource "azurerm_resource_group" "rg"{
  name     = "rg-az204-cert"
  location = "westus2"
}
resource "azurerm_storage_account" "rg" {
  name                      = "stoaz204certwestus2001"
  resource_group_name       = azurerm_resource_group.rg.name
  location                  = azurerm_resource_group.rg.location
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  

  tags = {
    enviroment = "CreateDestroy"
  }
}



