#서브넷 만들기
resource "azurerm_subnet" "elb_subnet" {
  name                 = "elb-subnet"
  resource_group_name  = azurerm_resource_group.jw_rg.name
  virtual_network_name = azurerm_virtual_network.jw_vpc.name
  address_prefixes     = ["10.0.1.0/24"]


}

resource "azurerm_subnet" "web_subnet" {
  name                 = "web-subnet"
  resource_group_name  = azurerm_resource_group.jw_rg.name
  virtual_network_name = azurerm_virtual_network.jw_vpc.name
  address_prefixes     = ["10.0.2.0/24"]


}

resource "azurerm_subnet" "was_subnet" {
  name                 = "was-subnet"
  resource_group_name  = azurerm_resource_group.jw_rg.name
  virtual_network_name = azurerm_virtual_network.jw_vpc.name
  address_prefixes     = ["10.0.3.0/24"]


}

resource "azurerm_subnet" "db_subnet" {
  name                 = "db-subnet"
  resource_group_name  = azurerm_resource_group.jw_rg.name
  virtual_network_name = azurerm_virtual_network.jw_vpc.name
  address_prefixes     = ["10.0.4.0/24"]


}
