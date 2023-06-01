# Use variables to customize the deployment

variable "root_parent_id" {
  type        = string
  description = ""
}

variable "root_id" {
  type        = string
  description = "Sets the value used for generating unique resource naming within the module."
}

variable "default_location" {
  type        = string
  description = ""
}

variable "primary_location" {
  type        = string
  description = "Sets the location for \"primary\" resources to be created in."
}

variable "secondary_location" {
  type        = string
  description = "Sets the location for \"secondary\" resources to be created in."
}

variable "subscription_id_connectivity" {
  type        = string
  description = "Subscription ID to use for \"connectivity\" resources."
}

variable "deploy_core_landing_zones" {
  type        = bool
  description = ""
}

variable "deploy_connectivity_resources" {
  type        = bool
  description = ""
}

variable "enable_ddos_protection" {
  type        = bool
  description = "Controls whether to create a DDoS Network Protection plan and link to hub virtual networks."
}

variable "connectivity_resources_tags" {
  type        = map(string)
  description = "Specify tags to add to \"connectivity\" resources."
}
