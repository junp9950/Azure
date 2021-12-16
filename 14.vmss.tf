resource "azurerm_linux_virtual_machine_scale_set" "jw_vmss" {
  name                = "jw-vmss"
  resource_group_name = azurerm_resource_group.jw_rg.name
  location            = azurerm_resource_group.jw_rg.location
  sku                 = "Standard_F2"
  instances           = 3
  admin_username      = "rara"
  admin_password      = "tlswldnd123@"

  disable_password_authentication = false

  upgrade_mode    = "Automatic"
  health_probe_id = azurerm_lb_probe.jw_probe.id


  source_image_reference {
    publisher = "OpenLogic" #발행 : 오픈로직
    offer     = "CentOS"    #운영체제
    sku       = "7.5"       #버전
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "vmss_nif"
    primary = true

    ip_configuration {
      name                                   = "internal"
      primary                                = true
      subnet_id                              = azurerm_subnet.elb_subnet.id
      load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.jw_backend.id]

    }
  }
}
