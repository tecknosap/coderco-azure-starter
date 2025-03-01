# Virtual Network Configuration
resource "azurerm_virtual_network" "coderco-vnet-module" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.vnet_address_space
}

# Subnet Configuration
resource "azurerm_subnet" "coderco-subnet-module" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.coderco-vnet-module.name
  address_prefixes     = var.subnet_address_prefix
}

# Network Security Group (NSG) Configuration
resource "azurerm_network_security_group" "coderco-nsg" {
  name                = var.nsg_name
  resource_group_name = var.resource_group_name
  location            = var.location
}

# Allow HTTP & HTTPS Traffic Rule
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
}

# Associate NSG with Subnet
resource "azurerm_subnet_network_security_group_association" "coderco_nsg_assoc" {
  subnet_id                 = azurerm_subnet.coderco-subnet-module.id
  network_security_group_id = azurerm_network_security_group.coderco-nsg.id
}
