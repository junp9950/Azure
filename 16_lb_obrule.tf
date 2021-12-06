resource "azurerm_lb_outbound_rule" "jw_ob_rule" {
    resource_group_name = azurerm_resource_group.jw_rg.name
    loadbalancer_id = azurerm_lb.jw_lb.id
    name = "ob_rule"
    protocol = "Tcp"
    backend_address_pool_id = azurerm_lb_backend_address_pool.jw_backend.id
   

    frontend_ip_configuration {
      name = "lb_front"
    }
}
