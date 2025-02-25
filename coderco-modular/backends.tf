terraform {
  backend "azurerm" {
    resource_group_name   = "az-01-rg"
    storage_account_name  = "stro90123wss"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}


