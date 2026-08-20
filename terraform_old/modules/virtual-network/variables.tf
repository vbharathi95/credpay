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
    default     = {}
  }  


variable "address_space" {
  description = "The address space for the virtual network"
  type        = string
  
}

variable "aks_subnet_prefix" {
  description = "The prefix for the AKS subnet"
  type        = string
 
}
variable "postgres_subnet_prefix" {
  description = "The prefix for the Postgres subnet"
  type        = string
  
}
