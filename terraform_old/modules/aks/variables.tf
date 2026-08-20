variable "name_prefix" {
    
    type        = string
    description = "The prefix to use for resource names"
  
}
variable "location" {
    type        = string
    description = "The Azure region to deploy resources in"
  
}
variable "resource_group_name" {
    type        = string
    description = "The name of the resource group"
    }
variable "tags" {
    type        = map(string)
    description = "A map of tags to assign to the resource group"
    
  }  
variable "aks_node_count" {
  description = "The number of nodes in the AKS cluster"
  type        = number
}
variable "minimum_node_count" {
  description = "The minimum number of nodes in the AKS cluster"
  type        = number
  
}
variable "aks_node_vm_size" {
    type        = string
    description = "The size of the AKS nodes"
    
}
variable "maximum_node_count" {
  description = "The maximum number of nodes in the AKS cluster"
  type        = number
  
}
variable "aks_subnet_id" {
  description = "The ID of the AKS subnet"
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace"
  type        = string
}
