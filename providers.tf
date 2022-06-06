# Azure Resource Manager and Azure Active Directory Terraform Providers are required

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.73.0"
    }
  }
  
  backend "azurerm" {
    resource_group_name  = "agrid-01-d1-hub-storage-rg-001"
    storage_account_name = "agrid01d1util01"
    tenant_id            = "f7d9f3f1-3841-4bfc-9cd4-c0e1964b5f86"
    subscription_id      = "a786eb34-3c9e-4875-a35b-d91487d59d5c"
  }

}

# Azure Resource Manager Provider for AGRID Spoke

provider "azurerm" {
  features {}

  subscription_id = var.application_subscription_id
  client_id       = var.cicd_sp_client_id
  client_secret   = var.cicd_sp_client_secret
  tenant_id       = var.cicd_sp_tenant_id

}
