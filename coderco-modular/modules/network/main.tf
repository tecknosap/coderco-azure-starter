######################################
# Virtual Network Configuration
# Creates an Azure Virtual Network (VNet) to enable communication between resources.
# The address space should be planned to avoid overlap with existing networks.
######################################
resource "azurerm_virtual_network" "coderco-vnet-module" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.vnet_address_space
}

######################################
# Subnet Configuration
# Defines a subnet within the Virtual Network.
# Subnets help segment the network and allocate resources logically.
######################################
resource "azurerm_subnet" "coderco-subnet-module" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.coderco-vnet-module.name
  address_prefixes     = var.subnet_address_prefix
}

######################################
# Network Security Group (NSG) Configuration
# Creates an NSG to control inbound and outbound network traffic.
# NSGs contain rules to allow or deny traffic based on defined conditions.
######################################
resource "azurerm_network_security_group" "coderco-nsg" {
  name                = var.nsg_name
  resource_group_name = var.resource_group_name
  location            = var.location
}

######################################
# Allow HTTP & HTTPS Traffic Rule
# Defines an NSG rule to allow inbound HTTP (port 80) and HTTPS (port 443) traffic.
# Ensures that web traffic can reach resources securely.
######################################
resource "azurerm_network_security_rule" "coderco_http" {
  name                        = "allow-http"
  priority                    = 100  # Lower priority ensures this rule is evaluated first
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80-443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.coderco-nsg.name

  # Allows incoming web traffic while maintaining security controls
}

######################################
# Associate NSG with Subnet
# Links the Network Security Group to the subnet.
# This ensures all resources within the subnet adhere to the NSG rules.
######################################
resource "azurerm_subnet_network_security_group_association" "coderco_nsg_assoc" {
  subnet_id                 = azurerm_subnet.coderco-subnet-module.id
  network_security_group_id = azurerm_network_security_group.coderco-nsg.id
}
