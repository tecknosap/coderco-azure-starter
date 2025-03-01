variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "coderco-tech-test"
}

variable "location" {
  description = "The location/region where resources will be created"
  type        = string
  default     = "Canada Central" # You can specify a default location or leave it empty
}

