# Use variables to customize the deployment

variable "root_id" {
  type    = string
  default = "rak"
}

variable "root_name" {
  type    = string
  default = "RAK Creations"
}

variable "deploy_connectivity_resources" {
  type    = bool
  default = true
}

variable "primary_location" {
  type        = string
  description = "Sets the location for \"primary\" resources to be created in."
  default     = "westeurope"
}

variable "connectivity_resources_location" {
  type    = string
  default = "uksouth"
}

variable "subscription_id_connectivity"{
  type =  string
  default = ""
}

variable "connectivity_resources_tags" {
  type = map(string)
  default = {
    demo_type = "deploy_connectivity_resources_custom"
  }
}