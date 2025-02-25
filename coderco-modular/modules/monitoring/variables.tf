###############################
# Resource Group Name
# The name of the resource group where the resources will be deployed.
###############################
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

###############################
# Location of the Resources
# Defines the Azure region where the resources will be deployed.
###############################
variable "location" {
  description = "The location of the resources"
  type        = string
}

###############################
# Log Analytics Workspace Name
# Specifies the name of the Log Analytics workspace used by VMSS for monitoring.
###############################
variable "log_analytics_work_space" {
  description = "VMSS log analytics workspace"
  type        = string
  default     = "coderco-log-analytics"
}

###############################
# Log Analytics SKU
# Defines the SKU for the Log Analytics workspace.
# "PerGB2018" is commonly used for cost-effective data collection and retention.
###############################
variable "sku" {
  description = "Log analytics workspace SKU"
  type        = string
  default     = "PerGB2018"
}

###############################
# Data Collection Rule Name
# Name of the data collection rule associated with the Log Analytics workspace.
###############################
variable "data_collection_rule_name" {
  description = "Data collection rule"
  type        = string
  default     = "coderco-dcr_rule"
}

###############################
# Data Collection Rule Association Name
# Defines the name for the association between the data collection rule and the VMSS.
###############################
variable "coderco_dcr_ass" {
  description = "Data collection rule association name"
  type        = string
  default     = "coderco-dcr-ass"
}

###############################
# VMSS ID
# The ID of the Virtual Machine Scale Set (VMSS) to be associated with the data collection rule.
###############################
variable "vmss_id" {
  description = "The VMSS ID"
  type        = string
}
