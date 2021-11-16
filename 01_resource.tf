# Create a resource group
resource "azurerm_resource_group" "jw_rg" {
  name     = "jeewoong"
  location = "koreacentral"
}