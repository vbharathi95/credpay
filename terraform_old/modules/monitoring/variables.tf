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

variable "log_retention_days" {
  description = "The number of days to retain logs"
  type        = number
  default     = 30
}
variable "tags" {
    type        = map(string)
    description = "A map of tags to assign to the resource group"
    default     = {}
}
