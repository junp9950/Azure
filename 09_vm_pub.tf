#vm 외부아이피
resource "azurerm_public_ip" "jw_vm_pub" {
  name                = "jw_vm_pub"
  resource_group_name = azurerm_resource_group.jw_rg.name
  location            = azurerm_resource_group.jw_rg.location
  allocation_method   = "Static" #정적


}
