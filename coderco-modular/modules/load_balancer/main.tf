######################################
# Public IP Resource for Load Balancer
# Creates a public IP resource to be used by the Load Balancer for external communication.
# The IP is assigned statically and can be used across multiple availability zones.
######################################
resource "azurerm_public_ip" "coderco_lb_module_pip" {
  name                = var.public_ip_name
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = var.allocation_method
  sku                 = var.public_ip_sku
  zones               = ["1", "2"]
}

######################################
# Load Balancer Resource
# Creates the Load Balancer which distributes traffic among VM instances based on the defined rules.
# The Load Balancer is associated with the previously created public IP.
######################################
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

######################################
# Load Balancer Backend Address Pool
# Creates a backend pool in the Load Balancer where VM instances will be registered.
# This pool allows Load Balancer to distribute traffic to the VMs based on their health and availability.
######################################
resource "azurerm_lb_backend_address_pool" "coderco_backend_pool" {
  name            = var.backend_pool_name
  loadbalancer_id = azurerm_lb.coderco_lb_module.id
}

######################################
# Health Probe for Load Balancer
# Defines a health probe that checks the health of the backend VM instances by sending requests to a specified port.
# If the VM is healthy, it receives traffic from the Load Balancer.
######################################
resource "azurerm_lb_probe" "coderco_lb_probe" {
  name            = var.health_probe_name
  loadbalancer_id = azurerm_lb.coderco_lb_module.id
  port            = var.probe_port
  protocol        = var.probe_protocol
  request_path    = var.probe_request_path
}

######################################
# Load Balancer Rule
# Defines a rule that binds a frontend IP configuration to the backend pool, specifying how traffic should be forwarded.
# It maps the frontend port to the backend port and uses the health probe for monitoring.
######################################
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
