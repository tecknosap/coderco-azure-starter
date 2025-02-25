######################################
# Backend Address Pool ID
# Outputs the ID of the backend address pool associated with the Load Balancer.
# This ID can be used for reference in other resources or configurations.
######################################
output "backend_address_pool_id" {
  value = azurerm_lb_backend_address_pool.coderco_backend_pool.id
}

######################################
# Health Probe ID
# Outputs the ID of the health probe associated with the Load Balancer.
# The health probe is used by the Load Balancer to monitor the health of backend instances.
######################################
output "health_probe_id" {
  value = azurerm_lb_probe.coderco_lb_probe.id
}
