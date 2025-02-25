######################################
# The name of the Virtual Network
# Defines the name of the Virtual Network (VNet) to be created.
# This is used to logically group subnets and resources within Azure.
######################################
variable "vnet_name" {
  description = "The name of the Virtual Network"
  type        = string
  default     = "coderco-vnet"
}

######################################
# The name of the resource group
# Specifies the Azure Resource Group where all resources will be deployed.
# This must be provided and cannot have a default value.
######################################
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

######################################
# The location of the resources
# Determines the Azure region where all resources will be deployed.
# Ensures consistency in resource placement.
######################################
variable "location" {
  description = "The location of the resources"
  type        = string
}

######################################
# The address space for the Virtual Network
# Defines the IP address range allocated to the VNet.
# This should be carefully planned to avoid conflicts with other networks.
######################################
variable "vnet_address_space" {
  description = "The address space for the Virtual Network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

######################################
# The name of the Subnet
# Specifies the name of the subnet within the Virtual Network.
# Subnets allow logical segmentation of resources.
######################################
variable "subnet_name" {
  description = "The name of the Subnet"
  type        = string
  default     = "coderco-subnet"
}

######################################
# The address prefix for the Subnet
# Defines the CIDR range allocated for the subnet.
# Should be a subset of the Virtual Network address space.
######################################
variable "subnet_address_prefix" {
  description = "The address prefix for the Subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

######################################
# The name of the Network Security Group
# Specifies the name of the NSG, which is used to control network traffic.
# It applies security rules to allow or deny traffic to resources.
######################################
variable "nsg_name" {
  description = "The name of the Network Security Group"
  type        = string
  default     = "coderco-nsg"
}
