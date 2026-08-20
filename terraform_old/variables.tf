#region
variable "location" {
  description = "The Azure region to deploy resources in"
  type        = string
  default     = "canadacentral"
}
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "credpay-rg"
}

#networkvariables
variable "address_space" {
  description = "The address space for the virtual network"
  type        = string
  default     = "10.0.0.0/16"
}

variable "aks_subnet_prefix" {
  description = "The prefix for the AKS subnet"
  type        = string
  default     = "10.0.1.0/24"
}
variable "postgres_subnet_prefix" {
  description = "The prefix for the Postgres subnet"
  type        = string
  default     = "10.0.2.0/24"
}

#aks
variable "aks_node_count" {
  description = "The number of nodes in the AKS cluster"
  type        = number
  default     = 3
}
variable "minimum_node_count" {
  description = "The minimum number of nodes in the AKS cluster"
  type        = number
  default     = 2
}
variable "maximum_node_count" {
  description = "The maximum number of nodes in the AKS cluster"
  type        = number
  default     = 5
}
variable "aks_node_vm_size" {
  type        = string
  description = "The size of the AKS nodes"
  default     = "Standard_D2alds_v6"
}
#postgress

variable "postgres_version" {
  description = "The version of the Postgres server"
  type        = number
  default     = 16
}
variable "postgres_admin_username" {
  description = "The admin username for the Postgres server"
  type        = string
  default     = "credpayadmin"
}
variable "database_name" {
  type        = string
  description = "The name of the Postgres database"
  default     = "credpaydb"
}
variable "log_retention_days" {
  description = "The number of days to retain logs"
  type        = number
  default     = 30
}