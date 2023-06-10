# Use variables to customize the deployment

variable "root_parent_id" {
  type        = string
  description = "Sets the root tenant ID, leave this blank if you are going to deploy the same tenant as you logged in"
  default     = ""
}
variable "root_id" {
  type        = string
  description = "Sets the value used for generating unique resource naming within the module."
  default     = ""
}

variable "root_name" {
  type        = string
  description = "Sets the value used for the \"intermediate root\" management group display name."
  default     = ""
}

variable "default_location" {
  type        = string
  description = "Sets the location for \"primary\" resources to be created in."
  default     = ""
}

variable "deploy_core_landing_zones" {
  type = bool
}

variable "primary_location" {
  type        = string
  description = "Sets the location for \"primary\" resources to be created in."
  default     = ""
}

variable "secondary_location" {
  type        = string
  description = "Sets the location for \"secondary\" resources to be created in."
  default     = ""
}

variable "subscription_id_identity" {
  type        = string
  description = "Subscription ID to use for \"identity\" resources."
  default     = ""
}

variable "deploy_identity_resources" {
  type = bool
}

/*variable "backend_storage_resource_group_name" {
  type = string
}

variable "backend_storage_account_name" {
  type = string
}

variable "backend_storage_account_container_name" {
  type = string
}

variable "backend_storage_account_key" {
  type = string
}*/