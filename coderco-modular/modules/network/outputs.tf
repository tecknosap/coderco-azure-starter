# Output: Subnet ID
output "subnet_id" {
  value = azurerm_subnet.coderco-subnet-module.id
}

# Output: Network Security Group ID
output "nsg_id" {
  value = azurerm_network_security_group.coderco-nsg.id
}
