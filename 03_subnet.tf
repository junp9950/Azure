resource "azurerm_subnet" "jw_subnet1" {
  name                 = "jw-subnet1"
  resource_group_name  = azurerm_resource_group.jw_rg.name
  virtual_network_name = azurerm_virtual_network.jw_vpc.name
  address_prefixes     = ["10.0.1.0/24"]

}