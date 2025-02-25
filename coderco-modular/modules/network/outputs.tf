######################################
# Output: Subnet ID
# This output provides the ID of the subnet created within the Azure Virtual Network.
# It is useful for referencing the subnet in other modules or resources.
######################################
output "subnet_id" {
  value = azurerm_subnet.coderco-subnet-module.id
}

######################################
# Output: Network Security Group ID
# This output provides the ID of the Network Security Group (NSG).
# It allows other resources or modules to associate with this NSG.
######################################
output "nsg_id" {
  value = azurerm_network_security_group.coderco-nsg.id
}
