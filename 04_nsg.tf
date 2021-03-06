#보안그룹 만들기
resource "azurerm_network_security_group" "jw_nsg_was" {
  name                = "nsg-was"
  location            = azurerm_resource_group.jw_rg.location
  resource_group_name = azurerm_resource_group.jw_rg.name

  security_rule {
    name                       = "tomcat_rule"
    priority                   = 102       #우선순위
    direction                  = "Inbound" #방향(in,out)
    access                     = "Allow"   #작업(허용,거부)
    protocol                   = "Tcp"     #프로토콜
    source_port_range          = "*"       #원본포트범위
    destination_port_range     = "8080"    #대상포트범위 (실제포트번호)
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }


}

resource "azurerm_network_security_group" "jw_nsg_elb" {
  name                = "nsg-elb"
  location            = azurerm_resource_group.jw_rg.location
  resource_group_name = azurerm_resource_group.jw_rg.name

  security_rule {
    name                       = "HTTP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }


}

resource "azurerm_network_security_group" "jw_nsg_web" {
  name                = "nsg-web"
  location            = azurerm_resource_group.jw_rg.location
  resource_group_name = azurerm_resource_group.jw_rg.name

  security_rule {
    name                       = "HTTP"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }


}

resource "azurerm_network_security_group" "jw_nsg_db" {
  name                = "nsg-db"
  location            = azurerm_resource_group.jw_rg.location
  resource_group_name = azurerm_resource_group.jw_rg.name
}

resource "azurerm_network_security_group" "jw_nsg_vmss" {
  name = "nsg-vmss"
  location            = azurerm_resource_group.jw_rg.location
  resource_group_name = azurerm_resource_group.jw_rg.name
  
}