
resource "azurerm_virtual_network" "vnet" {
  name                = format("%s-%s-%s", "vnet", var.prefix, var.environment)
  resource_group_name = var.resource_group_name
  location            = var.location

  address_space = ["192.168.0.0/24"]

  subnet {
    name             = "subnet-storage"
    address_prefixes = ["192.168.0.0/28"]
  }
}
