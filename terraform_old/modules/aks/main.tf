resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.name_prefix}-aks"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "${var.name_prefix}-aks-dns"
  node_resource_group = "${var.name_prefix}-aks-nodes"

  # Updated channel names
  automatic_channel_upgrade = "stable"
  node_os_channel_upgrade   = "NodeImage"

  oidc_issuer_enabled               = true
  azure_policy_enabled              = true
  role_based_access_control_enabled = true
  workload_identity_enabled         = true
  local_account_disabled            = false

  default_node_pool {
    name                = "system"
    node_count          = var.aks_node_count
    vm_size             = var.aks_node_vm_size
    vnet_subnet_id      = var.aks_subnet_id
    min_count           = var.minimum_node_count
    max_count           = var.maximum_node_count
    os_sku              = "Ubuntu"
    max_pods            = 110
    type                = "VirtualMachineScaleSets"
    
    # Updated auto-scaling name
    enable_auto_scaling = true

    upgrade_settings {
      max_surge = "70%"
    }
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
    outbound_type     = "loadBalancer"
    service_cidr      = "10.240.0.0/16"
    dns_service_ip    = "10.240.0.1"
  }

  oms_agent {
    log_analytics_workspace_id = var.log_analytics_workspace_id
  }

  tags = var.tags
}