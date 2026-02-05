module "vnet" {
  source              = "./modules/vnet"
  location            = var.location
  prefix              = var.prefix
  environment         = var.environment
  resource_group_name = "rg-state"
}
