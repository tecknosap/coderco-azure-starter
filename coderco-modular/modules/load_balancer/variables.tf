# Public IP Name
variable "public_ip_name" {
  description = "The name of the Public IP"
  type        = string
  default     = "coderco-public-ip"
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

# Public IP Allocation Method
variable "allocation_method" {
  description = "The allocation method for the Public IP"
  type        = string
  default     = "Static"
}

# Public IP SKU
variable "public_ip_sku" {
  description = "The SKU for the Public IP"
  type        = string
  default     = "Standard"
}

# Load Balancer Name
variable "lb_name" {
  description = "The name of the Load Balancer"
  type        = string
  default     = "coderco-lb"
}

# Load Balancer SKU
variable "lb_sku" {
  description = "The SKU of the Load Balancer"
  type        = string
  default     = "Standard"
}

# Frontend IP Configuration Name
variable "frontend_ip_name" {
  description = "The name of the Frontend IP Configuration"
  type        = string
  default     = "coderco-lb-fe"
}

# Backend Pool Name
variable "backend_pool_name" {
  description = "The name of the Backend Address Pool"
  type        = string
  default     = "coderco-backend-pool"
}

# Health Probe Name
variable "health_probe_name" {
  description = "The name of the Health Probe"
  type        = string
  default     = "http-probe"
}

# Health Probe Port
variable "probe_port" {
  description = "The port for the Health Probe"
  type        = number
  default     = 80
}

# Health Probe Protocol
variable "probe_protocol" {
  description = "The protocol for the Health Probe"
  type        = string
  default     = "Http"
}

# Health Probe Request Path
variable "probe_request_path" {
  description = "The request path for the Health Probe"
  type        = string
  default     = "/"
}

# Load Balancer Rule Name
variable "lb_rule_name" {
  description = "The name of the Load Balancer Rule"
  type        = string
  default     = "http-rule"
}

# Load Balancer Rule Protocol
variable "lb_rule_protocol" {
  description = "The protocol for the Load Balancer Rule"
  type        = string
  default     = "Tcp"
}

# Load Balancer Rule Port
variable "lb_rule_port" {
  description = "The port for the Load Balancer Rule"
  type        = number
  default     = 80
}
