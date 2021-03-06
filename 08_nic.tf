#네트워크 인터페이스
resource "azurerm_network_interface" "nif_jw" {
  name                = "jw_nif"
  location            = azurerm_resource_group.jw_rg.location
  resource_group_name = azurerm_resource_group.jw_rg.name

  ip_configuration { #ip 구성
    name                          = "internal"
    subnet_id                     = azurerm_subnet.web_subnet.id
    private_ip_address_allocation = "Dynamic" #동적인주소
    public_ip_address_id          = azurerm_public_ip.jw_vm_pub.id
  }
}
