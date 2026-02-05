terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.40.0"
    }
  }

  backend "azurerm" {}
}

provider "azurerm" {
  storage_use_azuread = true
  subscription_id     = "9bd80b22-3163-4980-aa11-f780fce86ad9"
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}
