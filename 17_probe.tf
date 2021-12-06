resource "azurerm_lb_probe" "jw_probe" {
  resource_group_name = azurerm_resource_group.jw_rg.name
  loadbalancer_id = azurerm_lb.jw_lb.id
  name = "80probe"
  port = 80
}