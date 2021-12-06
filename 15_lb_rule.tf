resource "azurerm_lb_rule" "jw_lb_rule" {
    resource_group_name = azurerm_resource_group.jw_rg.name
    loadbalancer_id = azurerm_lb.jw_lb.id
    name = "lb_rule"
    protocol = "TCP"
    frontend_port = 3389
    backend_port = 3389
    frontend_ip_configuration_name = "lb_front"
    disable_outbound_snat = "true"
  
}