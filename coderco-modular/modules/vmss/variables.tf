# VMSS Name
variable "vmss_name" {
  description = "The name of the VM Scale Set"
  type        = string
  default     = "coderco-test-vms"
}

# Resource Group Name
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

# Resource Location
variable "location" {
  description = "The location of the resources"
  type        = string
}

# VMSS SKU
variable "vmss_sku" {
  description = "The SKU for the VM Scale Set"
  type        = string
  default     = "Standard_D2s_v3"
}

# VMSS Instances
variable "vmss_instances" {
  description = "The number of instances in the VM Scale Set"
  type        = number
  default     = 2
}

# IP Configuration Name
variable "vmss_ipconfig_name" {
  description = "The IP configuration name for the VM Scale Set"
  type        = string
  default     = "coderco-ipconfig"
}

# Admin Username
variable "vmss_admin_username" {
  description = "The admin username for the VM Scale Set"
  type        = string
  default     = "codercoadmin"
}

# Subnet ID
variable "subnet_id" {
  description = "The ID of the subnet"
  type        = string
}

# Health Probe ID
variable "health_probe_id" {
  description = "The ID of the health probe"
  type        = string
}

# Load Balancer Backend Pool IDs
variable "load_balancer_backend_address_pool_ids" {
  description = "The backend address pool IDs for the load balancer"
  type        = list(string)
}
