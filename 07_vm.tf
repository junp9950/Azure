resource "azurerm_virtual_machine" "vm-jwshin" {
  name                  = "jwshin-vm"
  location              = azurerm_resource_group.jw_rg.location
  resource_group_name   = azurerm_resource_group.jw_rg.name
  network_interface_ids = [azurerm_network_interface.nif_jw.id]
  vm_size               = "Standard_DS1_v2"
  storage_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "7.5"
    version   = "latest"
  }
  storage_os_disk {
    name              = "jeewoongdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "junp"
    admin_username = "rara"
    admin_password = "tlswldnd123@"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }

}