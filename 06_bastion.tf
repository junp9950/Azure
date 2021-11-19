resource "azurerm_subnet" "AzureBastionSubnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.jw_rg.name
  virtual_network_name = azurerm_virtual_network.jw_vpc.name
  address_prefixes     = ["10.0.5.0/24"]
}

resource "azurerm_public_ip" "bastion_ip_jw" {
  name                = "bastion_ip"
  location            = azurerm_resource_group.jw_rg.location   
  resource_group_name = azurerm_resource_group.jw_rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "bastion_jw" {
  name                = "jw_bastion"
  location            = azurerm_resource_group.jw_rg.location
  resource_group_name = azurerm_resource_group.jw_rg.name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.AzureBastionSubnet.id
    public_ip_address_id = azurerm_public_ip.bastion_ip_jw.id
  }
}