resource "azurerm_public_ip" "lb_pub" {
  name = "jw_lbpubip"
  resource_group_name = azurerm_resource_group.jw_rg.name
  location = azurerm_resource_group.jw_rg.location
  allocation_method   = "Static"
  sku = "Standard"
}


resource "azurerm_lb" "jw_lb" {
    name = "jw_loadbalancer"
    location = "koreacentral"
    resource_group_name = azurerm_resource_group.jw_rg.name
    sku = "Standard"
    
  

    frontend_ip_configuration {
      name = "lb_front"
      public_ip_address_id = azurerm_public_ip.lb_pub.id
    }
  
}