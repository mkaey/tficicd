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

variable "vnet_address_space" {
  description = "The address space of the vnet"
  type        = list(string)
}

variable "subnets" {
  description = "Map of subnets to create in the virtual network"
  type = map(object({
    address_prefixes = list(string)
  }))
  default = {}
}
