######################################
# The name of the VM Scale Set
# Specifies the name of the Virtual Machine Scale Set (VMSS).
# The VMSS enables automatic scaling and load balancing for VMs.
######################################
variable "vmss_name" {
  description = "The name of the VM Scale Set"
  type        = string
  default     = "coderco-test-vms"
}

######################################
# The name of the resource group
# Defines the Azure Resource Group where the VMSS will be deployed.
# This must be specified and does not have a default value.
######################################
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

######################################
# The location of the resources
# Determines the Azure region where the VMSS and associated resources will be deployed.
# Ensures that all resources are provisioned in the same region.
######################################
variable "location" {
  description = "The location of the resources"
  type        = string
}

######################################
# VM Scale Set SKU configuration
# Defines the Azure VM size for the instances in the VMSS.
# The SKU determines the VM’s CPU, memory, and performance characteristics.
######################################
variable "vmss_sku" {
  description = "The SKU for the VM Scale Set"
  type        = string
  default     = "Standard_D2s_v3"
}

######################################
# VM Scale Set instances configuration
# Specifies the initial number of VM instances in the Scale Set.
# This number can scale dynamically based on load.
######################################
variable "vmss_instances" {
  description = "The number of instances in the VM Scale Set"
  type        = number
  default     = 2
}

######################################
# VM Scale Set IP configuration name
# Defines the name for the network interface IP configuration.
# Used to associate VM instances with networking resources.
######################################
variable "vmss_ipconfig_name" {
  description = "The IP configuration name for the VM Scale Set"
  type        = string
  default     = "coderco-ipconfig"
}

######################################
# The admin username for the VM Scale Set
# Specifies the administrator username for logging into VM instances.
# Should be combined with secure authentication methods.
######################################
variable "vmss_admin_username" {
  description = "The admin username for the VM Scale Set"
  type        = string
  default     = "codercoadmin"
}

######################################
# The ID of the subnet
# Provides the subnet ID where the VMSS instances will be deployed.
# Ensures the VMs are assigned to the appropriate network segment.
######################################
variable "subnet_id" {
  description = "The ID of the subnet"
  type        = string
}

######################################
# The ID of the health probe
# Defines the health probe ID used for load balancer health monitoring.
# Helps distribute traffic based on instance health.
######################################
variable "health_probe_id" {
  description = "The ID of the health probe"
  type        = string
}

######################################
# The backend address pool IDs for the load balancer
# Specifies the backend pool IDs to which VMSS instances will be associated.
# Enables load balancing across multiple VM instances.
######################################
variable "load_balancer_backend_address_pool_ids" {
  description = "The backend address pool IDs for the load balancer"
  type        = list(string)
}
