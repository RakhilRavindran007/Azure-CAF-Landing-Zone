# Use variables to customize the deployment

variable "root_id" {
  type        = string
  description = "Sets the value used for generating unique resource naming within the module."
  default     = "rak"
}

variable "root_name" {
  type        = string
  description = "Sets the value used for the \"intermediate root\" management group display name."
  default     = "RAK Creations"
}

variable "primary_location" {
  type        = string
  description = "Sets the location for \"primary\" resources to be created in."
  default     = "westeurope"
}

variable "secondary_location" {
  type        = string
  description = "Sets the location for \"secondary\" resources to be created in."
  default     = "northeurope"
}

variable "deploy_core_landing_zones" {
  type        = bool
  description = "True to deply core landing zone"
  default     = true
}

variable "deploy_custom_landing_zones" {
  type        = bool
  description = "True if custom landing zone need to deploy"
  default     = false
}

variable "deploy_identity_resources" {
  type        = bool
  description = "True if identity resource need to deploy"
  default     = false
}

variable "deploy_management_resources" {
  type        = bool
  description = "True if managment resource need to deploy"
  default     = false
}

variable "deploy_connectivity_resources" {
  type        = bool
  description = "True if connectivity resource need to deploy"
  default     = false
}

variable "configure_connectivity_resources" {
  type        = bool
  description = "True if connectivity resource need to configure"
  default     = false
}

variable "configure_management_resources" {
  type        = bool
  description = "True if management resource need to configure"
  default     = false
}

variable "subscription_id_management" {
  type        = string
  description = "Subscription ID to use for \"Management\" resources."
  default     = ""
}

variable "subscription_id_connectivity" {
  type        = string
  description = "Subscription ID to use for \"Connectivity\" resources."
  default     = ""
}

variable "subscription_id_identity" {
  type        = string
  description = "Subscription ID to use for \"identity\" resources."
  default     = ""
}
