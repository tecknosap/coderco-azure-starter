# Resource Group Name
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

# Location of the Resources
variable "location" {
  description = "The location of the resources"
  type        = string
}

# Log Analytics Workspace Name
variable "log_analytics_work_space" {
  description = "VMSS log analytics workspace"
  type        = string
  default     = "coderco-log-analytics"
}

# Log Analytics SKU
variable "sku" {
  description = "Log analytics workspace SKU"
  type        = string
  default     = "PerGB2018"
}

# Data Collection Rule Name
variable "data_collection_rule_name" {
  description = "Data collection rule"
  type        = string
  default     = "coderco-dcr_rule"
}

# Data Collection Rule Association Name
variable "coderco_dcr_ass" {
  description = "Data collection rule association name"
  type        = string
  default     = "coderco-dcr-ass"
}

# VMSS ID
variable "vmss_id" {
  description = "The VMSS ID"
  type        = string
}
