resource "azurerm_resource_group" "rg" {
  name     = format("%s-%s-%s", "rg", var.prefix, var.environment)
  location = var.location
}
module "vnet" {
  source              = "./modules/vnet"
  location            = var.location
  prefix              = var.prefix
  environment         = var.environment
  resource_group_name = azurerm_resource_group.rg.name
  vnet_address_space  = ["192.168.0.0/24"]
  subnets = {
    "subnet-nic"     = { address_prefixes = ["192.168.0.0/28"] }
    "subnet-storage" = { address_prefixes = ["192.168.0.16/28"] }
  }
}

resource "azurerm_network_interface" "nic" {
  name                = format("%s-%s-%s", "nic", var.prefix, var.environment)
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = module.vnet.subnet_ids["subnet-nic"]
    private_ip_address_allocation = "Dynamic"
  }
}
