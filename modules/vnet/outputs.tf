output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "subnet_ids" {
  description = "Map of subnet names to subnet IDs"
  value = {
    for subnet in azurerm_virtual_network.vnet.subnet :
    subnet.name => subnet.id
  }
}
