resource "azurerm_virtual_machine_scale_set_extension" "jw_vmss_ex" {
  name                         = "jw-vmss-ex"
  virtual_machine_scale_set_id = azurerm_linux_virtual_machine_scale_set.jw_vmss.id
  publisher                    = "Microsoft.Azure.Extensions"
  type                         = "CustomScript"
  type_handler_version         = "2.0"
  settings                     = <<SETTINGS
    {
        "script": "${filebase64("script__2tier_.sh")}"
    }
SETTINGS


}
