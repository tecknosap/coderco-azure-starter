# The name of the Virtual Network
variable "vnet_name" {
  description = "The name of the Virtual Network"
  type        = string
  default     = "coderco-vnet"
}

# The name of the resource group
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

# The location of the resources
variable "location" {
  description = "The location of the resources"
  type        = string
}

# The address space for the Virtual Network
variable "vnet_address_space" {
  description = "The address space for the Virtual Network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

# The name of the Subnet
variable "subnet_name" {
  description = "The name of the Subnet"
  type        = string
  default     = "coderco-subnet"
}

# The address prefix for the Subnet
variable "subnet_address_prefix" {
  description = "The address prefix for the Subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

# The name of the Network Security Group
variable "nsg_name" {
  description = "The name of the Network Security Group"
  type        = string
  default     = "coderco-nsg"
}
