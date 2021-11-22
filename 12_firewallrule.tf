#DB방화벽
resource "azurerm_mysql_firewall_rule" "jw_fwall_rule" {
  name                = "jw-firewall-rule"
  resource_group_name = azurerm_resource_group.jw_rg.name
  server_name         = azurerm_mysql_server.jwshin_mysql.name
  start_ip_address    = "0.0.0.0" #0.0.0.0하면 Azure 방문서비스허용
  end_ip_address      = "0.0.0.0" #이곳에 IP를 집어넣을 시 그 IP만 사용가능

}
