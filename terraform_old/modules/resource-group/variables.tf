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
