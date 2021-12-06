resource "azurerm_lb_backend_address_pool" "jw_backend" {
  loadbalancer_id = azurerm_lb.jw_lb.id
  name            = "backend"
}