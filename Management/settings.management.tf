# Configure the management resources settings.
locals {
  configure_management_resources = {
    settings = {
      log_analytics = {
        enabled = true
        config = {
          retention_in_days                                 = var.log_retention_in_days
          enable_monitoring_for_vm                          = true
          enable_monitoring_for_vmss                        = true
          enable_solution_for_agent_health_assessment       = true
          enable_solution_for_anti_malware                  = true
          enable_solution_for_change_tracking               = true
          enable_solution_for_service_map                   = false
          enable_solution_for_sql_assessment                = false
          enable_solution_for_sql_vulnerability_assessment  = false
          enable_solution_for_sql_advanced_threat_detection = false
          enable_solution_for_updates                       = true
          enable_solution_for_vm_insights                   = true
          enable_sentinel                                   = true
        }
      }
      security_center = {
        enabled = true
        config = {
          email_security_contact             = var.email_security_contact
          enable_defender_for_app_services   = true
          enable_defender_for_arm            = true
          enable_defender_for_containers     = true
          enable_defender_for_dns            = true
          enable_defender_for_key_vault      = true
          enable_defender_for_oss_databases  = true
          enable_defender_for_servers        = true
          enable_defender_for_sql_servers    = true
          enable_defender_for_sql_server_vms = true
          enable_defender_for_storage        = true
        }
      }
    }
    # Set the default location
    location = var.primary_location
    # Create a custom tags input
    tags = var.management_resources_tags
    advanced = {
      custom_settings_by_resource_type = {
        azurerm_resource_group = {
          management = {
            name = "rg-management-we-01"
          }
        },
        azurerm_log_analytics_workspace = {
          management = {
            name = "law-management-we-01"
          }
        },
        azurerm_automation_account = {
          management = {
            name = "aa-management-we-01"
          }
        }
      }
    }
  }
}
