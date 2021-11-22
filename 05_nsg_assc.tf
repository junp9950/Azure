#보안그룹 서브넷에 배정
resource "azurerm_subnet_network_security_group_association" "nsg_assc_elb" {
  subnet_id                 = azurerm_subnet.elb_subnet.id
  network_security_group_id = azurerm_network_security_group.jw_nsg_elb.id
}

resource "azurerm_subnet_network_security_group_association" "nsg_assc_was" {
  subnet_id                 = azurerm_subnet.was_subnet.id
  network_security_group_id = azurerm_network_security_group.jw_nsg_was.id
}

resource "azurerm_subnet_network_security_group_association" "nsg_assc_web" {
  subnet_id                 = azurerm_subnet.web_subnet.id
  network_security_group_id = azurerm_network_security_group.jw_nsg_web.id
}

resource "azurerm_subnet_network_security_group_association" "nsg_assc_db" {
  subnet_id                 = azurerm_subnet.db_subnet.id
  network_security_group_id = azurerm_network_security_group.jw_nsg_db.id
}
