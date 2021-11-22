terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm" #default 값
      version = "=2.46.0"           #버전
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id = "268a434d-f7e6-4966-bb27-d29e20a1b360" #구독 코드
}
