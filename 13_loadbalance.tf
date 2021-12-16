resource "azurerm_public_ip" "lb_pub" {
  name                = "jw_lbpubip"
  resource_group_name = azurerm_resource_group.jw_rg.name
  location            = azurerm_resource_group.jw_rg.location
  allocation_method   = "Static"
  sku                 = "Standard"
}


resource "azurerm_lb" "jw_lb" {
  name                = "jw_loadbalancer"
  location            = azurerm_resource_group.jw_rg.location
  resource_group_name = azurerm_resource_group.jw_rg.name
  sku                 = "Standard"



  frontend_ip_configuration {
    name                 = "lb_front"
    public_ip_address_id = azurerm_public_ip.lb_pub.id
  }

}

resource "azurerm_lb_backend_address_pool" "jw_backend" {
  loadbalancer_id = azurerm_lb.jw_lb.id
  name            = "back"
  resource_group_name = azurerm_resource_group.jw_rg.name
}

resource "azurerm_lb_rule" "jw_lb_rule" {
  resource_group_name            = azurerm_resource_group.jw_rg.name
  loadbalancer_id                = azurerm_lb.jw_lb.id
  name                           = "lb_rule"
  protocol                       = "TCP"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "lb_front"
  disable_outbound_snat          = true
  probe_id                       = azurerm_lb_probe.jw_probe.id
  backend_address_pool_id        = azurerm_lb_backend_address_pool.jw_backend.id
}

resource "azurerm_lb_outbound_rule" "jw_ob_rule" {
    resource_group_name = azurerm_resource_group.jw_rg.name
    loadbalancer_id = azurerm_lb.jw_lb.id
    name = "ob_rule"
    protocol = "All"
    backend_address_pool_id = azurerm_lb_backend_address_pool.jw_backend.id
    allocated_outbound_ports = 1024

    frontend_ip_configuration {
      name = "lb_front"
    }
}

resource "azurerm_lb_probe" "jw_probe" {
  resource_group_name = azurerm_resource_group.jw_rg.name
  loadbalancer_id     = azurerm_lb.jw_lb.id
  name                = "80probe"
  protocol            = "Http"
  request_path        = "/health.html"
  port                = 80
}

/* output "lb_pub" {
  value = azurerm_public_ip.lb_pub.id
} */
