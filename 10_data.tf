#vm유저데이터
resource "azurerm_virtual_machine_extension" "jw_data" {
  name                 = "jw_data"
  virtual_machine_id   = azurerm_virtual_machine.vm-jwshin.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"
  settings             = <<SETTINGS
    {
        "script": "${filebase64("script__2tier_.sh")}"
    }
SETTINGS


}
