# Backend Address Pool ID
# Output for referencing the backend pool.
output "backend_address_pool_id" {
  value = azurerm_lb_backend_address_pool.coderco_backend_pool.id
}

# Health Probe ID
# Output for referencing the health probe.
output "health_probe_id" {
  value = azurerm_lb_probe.coderco_lb_probe.id
}
