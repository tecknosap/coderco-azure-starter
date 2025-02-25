terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.20.0"  # This pins the version to 4.20.x
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {
    
  }
}
