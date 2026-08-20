resource "azurerm_log_analytics_workspace" "log_analytics" {
  name                = "${var.name_prefix}-log-analytics"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = var.log_retention_days
  tags                = var.tags
}
#for container insights
resource "azurerm_log_analytics_solution" "container_insights_solution" {
  solution_name         = "${var.name_prefix}-container-insights_solution"
  location              = var.location
  resource_group_name   = var.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.log_analytics.id
  workspace_name        = azurerm_log_analytics_workspace.log_analytics.name
  plan {
    publisher = "Microsoft"
    product   = "ContainerInsights"
  }
  tags = var.tags
}
