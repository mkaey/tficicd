variable "environment" {
  type        = string
  description = "The environment name"
}

variable "prefix" {
  type        = string
  description = "The environment name"
}

variable "location" {
  description = "Location of the Resources created"
  type        = any
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}
