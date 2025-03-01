# Resource Group
resource "azurerm_resource_group" "coderco" {
  name     = var.resource_group_name
  location = var.location
}

# Network Module
module "network" {
  source              = "./modules/network"
  resource_group_name = azurerm_resource_group.coderco.name
  location            = azurerm_resource_group.coderco.location
}

# Load Balancer Module
module "lb" {
  source              = "./modules/load_balancer"
  resource_group_name = azurerm_resource_group.coderco.name
  location            = azurerm_resource_group.coderco.location
}

# VMSS Module
module "vmss" {
  source                                 = "./modules/vmss"
  resource_group_name                    = azurerm_resource_group.coderco.name
  location                               = azurerm_resource_group.coderco.location
  subnet_id                              = module.network.subnet_id
  load_balancer_backend_address_pool_ids = [module.lb.backend_address_pool_id]
  health_probe_id                        = module.lb.health_probe_id
  depends_on                             = [module.network, module.lb]
}

# Monitoring Module
module "law" {
  source              = "./modules/monitoring"
  resource_group_name = azurerm_resource_group.coderco.name
  location            = azurerm_resource_group.coderco.location
  vmss_id             = module.vmss.vmss_id
  depends_on          = [module.vmss]
}
