locals {
  name_prefix = "credpay"
  tags = {
    environment = "dev"
    project     = "credpay"
  }
}

module "resource_group" {
  source              = "./modules/resource-group"
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = local.tags
}
module "vnet" {
  source                 = "./modules/virtual-network"
  name_prefix            = local.name_prefix
  location               = module.resource_group.location
  resource_group_name    = module.resource_group.resource_group_name
  address_space          = var.address_space
  aks_subnet_prefix      = var.aks_subnet_prefix
  postgres_subnet_prefix = var.postgres_subnet_prefix
  tags                   = local.tags
}
module "monitoring" {
  source              = "./modules/monitoring"
  name_prefix         = local.name_prefix
  location            = module.resource_group.location
  resource_group_name = module.resource_group.resource_group_name
  tags                = local.tags
  log_retention_days  = var.log_retention_days

}
module "postgress" {
  source              = "./modules/postgress"
  name_prefix         = local.name_prefix
  location            = module.resource_group.location
  resource_group_name = module.resource_group.resource_group_name
  tags                = local.tags

  database_name           = var.database_name
  postgres_version        = var.postgres_version
  postgres_admin_username = var.postgres_admin_username

}
module "aks" {
  source                     = "./modules/aks"
  name_prefix                = local.name_prefix
  location                   = var.location
  resource_group_name        = module.resource_group.resource_group_name
  tags                       = local.tags
  aks_node_count             = var.aks_node_count
  minimum_node_count         = var.minimum_node_count
  maximum_node_count         = var.maximum_node_count
  aks_node_vm_size           = var.aks_node_vm_size
  log_analytics_workspace_id = module.monitoring.workspace_id
  aks_subnet_id              = module.vnet.aks_subnet_id
}

