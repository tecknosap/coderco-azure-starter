provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "coderco" {
  name     = "coderco-tech-test"
  location = "West Europe"
}

resource "azurerm_virtual_network" "coderco_vnet" {
  name                = "coderco-vnet"
  location            = azurerm_resource_group.coderco.location
  resource_group_name = azurerm_resource_group.coderco.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "coderco_subnet" {
  name                 = "coderco-subnet"
  resource_group_name  = azurerm_resource_group.coderco.name
  virtual_network_name = azurerm_virtual_network.coderco_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
  
  # Added NSG association to the subnet
}

resource "azurerm_public_ip" "coderco_lb" {
  name                = "coderco-public-ip"
  location            = azurerm_resource_group.coderco.location
  resource_group_name = azurerm_resource_group.coderco.name
  allocation_method   = "Dynamic"
  sku                 = "Basic"
}

resource "azurerm_lb" "coderco_lb" {
  name                = "coderco-lb"
  location            = azurerm_resource_group.coderco.location
  resource_group_name = azurerm_resource_group.coderco.name
  sku                 = "Basic"

  frontend_ip_configuration {
    name                 = "coderco-lb-fe"
    public_ip_address_id = azurerm_public_ip.coderco_lb.id
  }

  # Fixed load balancer SKU consistency
}

resource "azurerm_lb_backend_address_pool" "coderco_backend_pool" {
  name            = "coderco-backend-pool"
  loadbalancer_id = azurerm_lb.coderco_lb.id
}

resource "azurerm_network_security_group" "coderco_nsg" {
  name                = "coderco-nsg"
  location            = azurerm_resource_group.coderco.location
  resource_group_name = azurerm_resource_group.coderco.name
}

resource "azurerm_network_security_rule" "coderco_http" {
  name                        = "allow-http"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.coderco.name
  network_security_group_name = azurerm_network_security_group.coderco_nsg.name

  # Added missing protocol version in security rules
}

resource "azurerm_network_security_rule" "coderco_ssh" {
  name                        = "allow-ssh"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.coderco.name
  network_security_group_name = azurerm_network_security_group.coderco_nsg.name

  # Added SSH access rule in NSG
}

resource "azurerm_subnet_network_security_group_association" "coderco_nsg_assoc" {
  subnet_id                 = azurerm_subnet.coderco_subnet.id
  network_security_group_id = azurerm_network_security_group.coderco_nsg.id

  # Added explicit dependency on NSG association
}

resource "azurerm_lb_probe" "coderco_lb_probe" {
  name                = "http-probe"
  loadbalancer_id     = azurerm_lb.coderco_lb.id
  port                = 80
  protocol            = "Http"
  request_path        = "/"

  # Added proper load balancer health probe and rule
}

resource "azurerm_lb_rule" "coderco_lb_rule" {
  name                           = "http-rule"
  loadbalancer_id                = azurerm_lb.coderco_lb.id
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "coderco-lb-fe"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.coderco_backend_pool.id]
  probe_id                       = azurerm_lb_probe.coderco_lb_probe.id
}

resource "azurerm_linux_virtual_machine_scale_set" "coderco_vmss" {
  name                = "coderco-vmss"
  resource_group_name = azurerm_resource_group.coderco.name
  location            = azurerm_resource_group.coderco.location
  sku                 = "Standard_DS1_v2"
  instances           = 2
  admin_username      = "codercoadmin"
  health_probe_id     = azurerm_lb_probe.coderco_lb_probe.id

  admin_ssh_key {
    username   = "codercoadmin"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"

    # Updated to Ubuntu 22.04 LTS image
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "coderco-nic"
    primary = true

    ip_configuration {
      name                                   = "coderco-ipconfig"
      primary                                = true
      subnet_id                              = azurerm_subnet.coderco_subnet.id
      load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.coderco_backend_pool.id]
    }
  }

  custom_data = base64encode(<<-EOF
    #!/bin/bash
    apt-get update -y
    apt-get install -y apache2
    echo "Hello! Your CoderCo Tech Test VM is working!" > /var/www/html/index.html
    systemctl enable apache2
    systemctl start apache2
  EOF
  )

  depends_on = [
    azurerm_subnet_network_security_group_association.coderco_nsg_assoc
  ]

  tags = {
    environment = "test"
  }


}
