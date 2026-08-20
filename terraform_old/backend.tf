terraform {
  backend "azurerm" {
    resource_group_name  = "credpay"
    storage_account_name = "credpaysa12"
    container_name       = "statefulset"
    key                  = "terraform.tfstate"


  }
}