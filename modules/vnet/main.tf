
resource "azurerm_virtual_network" "vnet" {
  name                = format("%s-%s-%s", "vnet", var.prefix, var.environment)
  resource_group_name = var.resource_group_name
  location            = var.location

  address_space = var.vnet_address_space

  dynamic "subnet" {
    for_each = var.subnets
    content {
      name             = subnet.key
      address_prefixes = subnet.value.address_prefixes
    }
  }
}
