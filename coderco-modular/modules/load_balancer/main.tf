# Public IP for Load Balancer
# Static IP used for external communication.
resource "azurerm_public_ip" "coderco_lb_module_pip" {
  name                = var.public_ip_name
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = var.allocation_method
  sku                 = var.public_ip_sku
  zones               = ["1", "2"]
}

# Load Balancer
# Distributes traffic among backend VMs.
resource "azurerm_lb" "coderco_lb_module" {
  name                = var.lb_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.lb_sku

  frontend_ip_configuration {
    name                 = var.frontend_ip_name
    public_ip_address_id = azurerm_public_ip.coderco_lb_module_pip.id
  }
}

# Backend Pool
# Registers VM instances for load balancing.
resource "azurerm_lb_backend_address_pool" "coderco_backend_pool" {
  name            = var.backend_pool_name
  loadbalancer_id = azurerm_lb.coderco_lb_module.id
}

# Health Probe
# Monitors VM health for traffic distribution.
resource "azurerm_lb_probe" "coderco_lb_probe" {
  name            = var.health_probe_name
  loadbalancer_id = azurerm_lb.coderco_lb_module.id
  port            = var.probe_port
  protocol        = var.probe_protocol
  request_path    = var.probe_request_path
}

# Load Balancer Rule
# Defines traffic forwarding behavior.
resource "azurerm_lb_rule" "coderco_lb_rule" {
  name                           = var.lb_rule_name
  loadbalancer_id                = azurerm_lb.coderco_lb_module.id
  protocol                       = var.lb_rule_protocol
  frontend_port                  = var.lb_rule_port
  backend_port                   = var.lb_rule_port
  frontend_ip_configuration_name = var.frontend_ip_name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.coderco_backend_pool.id]
  probe_id                       = azurerm_lb_probe.coderco_lb_probe.id
}
