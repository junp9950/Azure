#베스천 만들기
resource "azurerm_subnet" "AzureBastionSubnet" { #애저베스천 사용을 위해선 무조건 AzureBastionSubnet 사용
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.jw_rg.name
  virtual_network_name = azurerm_virtual_network.jw_vpc.name
  address_prefixes     = ["10.0.5.0/24"] #IP주소
}

#베스천 공용IP 생성
resource "azurerm_public_ip" "bastion_ip_jw" {
  name                = "bastion_ip"
  location            = azurerm_resource_group.jw_rg.location
  resource_group_name = azurerm_resource_group.jw_rg.name
  allocation_method   = "Static"   #할당 방법 : 정적인
  sku                 = "Standard" #공용아이피 주소 sku
}
#베스천 할당
resource "azurerm_bastion_host" "bastion_jw" {
  name                = "jw_bastion"
  location            = azurerm_resource_group.jw_rg.location
  resource_group_name = azurerm_resource_group.jw_rg.name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.AzureBastionSubnet.id
    public_ip_address_id = azurerm_public_ip.bastion_ip_jw.id
  }
}
