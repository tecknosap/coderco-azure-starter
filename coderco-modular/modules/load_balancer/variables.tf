######################################
# The name of the Public IP
# Specifies the name for the Public IP resource.
# Used to identify and manage the Public IP in the Azure environment.
######################################
variable "public_ip_name" {
  description = "The name of the Public IP"
  type        = string
  default     = "coderco-public-ip"
}

######################################
# The name of the resource group
# Specifies the name of the Azure Resource Group where the resources will be deployed.
# The Resource Group provides a container for managing the resources.
######################################
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

######################################
# The location of the resources
# Defines the Azure region where the resources (like Public IP, Load Balancer) will be deployed.
# Ensures resources are provisioned in the desired geographical location.
######################################
variable "location" {
  description = "The location of the resources"
  type        = string
}

######################################
# The allocation method for the Public IP
# Defines whether the Public IP is allocated dynamically or statically.
# Static ensures that the IP address does not change, while Dynamic can change.
######################################
variable "allocation_method" {
  description = "The allocation method for the Public IP"
  type        = string
  default     = "Static"
}

######################################
# The SKU for the Public IP
# Specifies the SKU (pricing tier) of the Public IP.
# Standard provides enhanced features like global reach and static IP.
######################################
variable "public_ip_sku" {
  description = "The SKU for the Public IP"
  type        = string
  default     = "Standard"
}

######################################
# The name of the Load Balancer
# Specifies the name of the Azure Load Balancer to distribute traffic across the VMs.
######################################
variable "lb_name" {
  description = "The name of the Load Balancer"
  type        = string
  default     = "coderco-lb"
}

######################################
# The SKU of the Load Balancer
# Defines the SKU for the Load Balancer, which affects its capabilities and performance.
# Standard SKU supports more advanced features such as zones and better scalability.
######################################
variable "lb_sku" {
  description = "The SKU of the Load Balancer"
  type        = string
  default     = "Standard"
}

######################################
# The name of the Frontend IP Configuration
# Defines the name of the frontend IP configuration for the Load Balancer.
# This represents the IP address exposed to the internet.
######################################
variable "frontend_ip_name" {
  description = "The name of the Frontend IP Configuration"
  type        = string
  default     = "coderco-lb-fe"
}

######################################
# The name of the Backend Address Pool
# Specifies the name of the backend pool to which the VMSS instances are connected.
# This pool enables the Load Balancer to distribute traffic across VMs.
######################################
variable "backend_pool_name" {
  description = "The name of the Backend Address Pool"
  type        = string
  default     = "coderco-backend-pool"
}

######################################
# The name of the Health Probe
# Specifies the name of the Health Probe used by the Load Balancer to check VM health.
# It ensures that traffic is only sent to healthy instances.
######################################
variable "health_probe_name" {
  description = "The name of the Health Probe"
  type        = string
  default     = "http-probe"
}

######################################
# The port for the Health Probe
# Specifies the port the Load Balancer will use to check the health of instances.
# Usually set to the port the application or service listens on.
######################################
variable "probe_port" {
  description = "The port for the Health Probe"
  type        = number
  default     = 80
}

######################################
# The protocol for the Health Probe
# Specifies the protocol (HTTP, HTTPS, etc.) used for the Health Probe.
# HTTP is commonly used for checking web service health.
######################################
variable "probe_protocol" {
  description = "The protocol for the Health Probe"
  type        = string
  default     = "Http"
}

######################################
# The request path for the Health Probe
# Defines the path that the Load Balancer uses for the health check.
# Commonly set to the root ("/") for web applications.
######################################
variable "probe_request_path" {
  description = "The request path for the Health Probe"
  type        = string
  default     = "/"
}

######################################
# The name of the Load Balancer Rule
# Specifies the rule for the Load Balancer to follow for distributing traffic.
# Defines the listener configuration and backend pool association.
######################################
variable "lb_rule_name" {
  description = "The name of the Load Balancer Rule"
  type        = string
  default     = "http-rule"
}

######################################
# The protocol for the Load Balancer Rule
# Defines the protocol used by the Load Balancer to route traffic (e.g., TCP or UDP).
# TCP is commonly used for web traffic.
######################################
variable "lb_rule_protocol" {
  description = "The protocol for the Load Balancer Rule"
  type        = string
  default     = "Tcp"
}

######################################
# The port for the Load Balancer Rule
# Defines the port the Load Balancer listens on for incoming traffic.
# Often set to port 80 for HTTP or port 443 for HTTPS.
######################################
variable "lb_rule_port" {
  description = "The port for the Load Balancer Rule"
  type        = number
  default     = 80
}
