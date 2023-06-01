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
  type    = bool
}

variable "primary_location" {
  type        = string
  description = "Sets the location for \"primary\" resources to be created in."
  default     = ""
}

variable "subscription_id_management" {
  type        = string
  description = "Subscription ID to use for \"management\" resources." #need to modify
}

variable "deploy_management_resources" {
  type = bool
}

variable "email_security_contact" {
  type        = string
  description = "Set a custom value for the security contact email address."
  default     = ""
}

variable "log_retention_in_days" {
  type        = number
  description = "Set a custom value for how many days to store logs in the Log Analytics workspace."
}

variable "management_resources_tags" {
  type        = map(string)
  description = "Specify tags to add to \"management\" resources."
}
