# Create a resource group
resource "azurerm_resource_group" "jw_rg" { #리소스그룹 만들기
  name     = "jeewoong"                     #리소스스룹 이름
  location = "koreacentral"                 #지역(한국중부)
}
