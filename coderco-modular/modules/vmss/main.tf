# Autoscale Settings for VMSS
resource "azurerm_monitor_autoscale_setting" "coderco_vmss_autoscale" {
  name                = "${var.vmss_name}-autoscale"
  resource_group_name = var.resource_group_name
  location            = var.location
  target_resource_id  = azurerm_linux_virtual_machine_scale_set.coderco_vmss.id

  enabled = true

  profile {
    name = "Dynamic Scaling"

    capacity {
      default = 3  # Initial number of VM instances
      minimum = 1  # Minimum number of instances
      maximum = 10 # Maximum number of instances allowed
    }

    # Scale Out Rule - Increase VMs when CPU > 70%
    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = azurerm_linux_virtual_machine_scale_set.coderco_vmss.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "GreaterThan"
        threshold          = 70
      }

      scale_action {
        direction = "Increase"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT5M"  # Ensures stability before another scaling event
      }
    }

    # Scale In Rule - Decrease VMs when CPU < 30%
    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = azurerm_linux_virtual_machine_scale_set.coderco_vmss.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "LessThan"
        threshold          = 30
      }

      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT5M"
      }
    }
  }

  # Notification Settings
  notification {
    email {
      custom_emails = ["tecknosap@gmail.com"]
    }
  }
}

# Virtual Machine Scale Set (VMSS)
resource "azurerm_linux_virtual_machine_scale_set" "coderco_vmss" {
  name                = var.vmss_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.vmss_sku
  instances           = var.vmss_instances
  admin_username      = var.vmss_admin_username
  health_probe_id     = var.health_probe_id
  #encryption_at_host_enabled = true  # Uncomment to enable host encryption

  zones        = ["1", "2"]  # Distributes VMs across availability zones
  zone_balance = true        # Ensures even distribution across zones

  # SSH Key for Secure Access
  admin_ssh_key {
    username   = var.vmss_admin_username
    public_key = file("~/.ssh/id_rsa.pub")
  }

  # OS Image Configuration
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  # OS Disk Configuration
  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  # Network Configuration
  network_interface {
    name    = "coderco-nic"
    primary = true

    ip_configuration {
      name                                   = var.vmss_ipconfig_name
      primary                                = true
      subnet_id                              = var.subnet_id
      load_balancer_backend_address_pool_ids = var.load_balancer_backend_address_pool_ids
    }
  }

  # Custom Initialization Script
  custom_data = base64encode(<<-EOF
    #!/bin/bash
    apt-get update -y
    apt-get install -y apache2
    echo "Hello! Your CoderCo Tech Test VMSS is working!" > /var/www/html/index.html
    systemctl enable apache2
    systemctl start apache2
  EOF
  )

  # Resource Tagging
  tags = {
    environment = "test"
  }
}

# Azure Monitor Agent (AMA) Extension
resource "azurerm_virtual_machine_scale_set_extension" "coderco_ama" {
  name                           = "AzureMonitorLinuxAgent"
  virtual_machine_scale_set_id   = azurerm_linux_virtual_machine_scale_set.coderco_vmss.id
  publisher                      = "Microsoft.Azure.Monitor"
  type                           = "AzureMonitorLinuxAgent"
  type_handler_version           = "1.10"  # Latest stable version
  auto_upgrade_minor_version     = true
}
