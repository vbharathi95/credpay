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

variable "postgres_version" {
  description = "The version of the Postgres server"
  type        = number
  
}
variable "postgres_admin_username" {
  description = "The admin username for the Postgres server"
  type        = string
  
}
variable "database_name" {
    type        = string
    description = "The name of the Postgres database"
    
}
