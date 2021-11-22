#db서버 생성
resource "azurerm_mysql_server" "jwshin_mysql" {
  name                = "mysql-jwshin"
  resource_group_name = azurerm_resource_group.jw_rg.name
  location            = azurerm_resource_group.jw_rg.location

  administrator_login          = "rara"         #사용자이름
  administrator_login_password = "tlswldnd123@" #사용지 비밀번호

  sku_name   = "GP_Gen5_2" #5세데_v코어 최대2대
  storage_mb = 5120        #스토리지 크기 (5GB)
  version    = "5.7"       #버전

  auto_grow_enabled                 = false #스토리지 자동증가
  backup_retention_days             = 7     #백업보존기간
  geo_redundant_backup_enabled      = true  #로컬중복 false시 지역중복
  infrastructure_encryption_enabled = false #인프라 이중암호사용
  public_network_access_enabled     = true  #퍼블릭네트워크 엑세스 거부
  ssl_enforcement_enabled           = false #ssl설정
  # ssl_minimal_tls_version_enforced = "TLS1_2" #TLS설정 
}
resource "azurerm_mysql_database" "wordpress" {
  name                = "wordpress"
  resource_group_name = azurerm_resource_group.jw_rg.name
  server_name         = azurerm_mysql_server.jwshin_mysql.name
  charset             = "utf8"            #인코딩코드
  collation           = "utf8_unicode_ci" #인코딩코드 한글사용시 적어주면됨 
}
