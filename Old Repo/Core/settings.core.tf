# Configure the custom landing zones to deploy in
# addition to the core resource hierarchy
locals {
  custom_landing_zones = {
    "${var.root_id}-online" = {
      display_name               = "${upper(var.root_id)} Online"
      parent_management_group_id = "${var.root_id}-landing-zones"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "customer_online"
        parameters     = {}
        access_control = {}
      }
    }
    "${var.root_id}-marketing" = {
      display_name               = "${upper(var.root_id)} Marketing"
      parent_management_group_id = "${var.root_id}-landing-zones"
      subscription_ids           = []
      archetype_config = {
        archetype_id = "customer_online"
        parameters = {
          Deny-Resource-Locations = {
            listOfAllowedLocations = [
              var.primary_location,
              var.secondary_location,
            ]
          }
          Deny-RSG-Locations = {
            listOfAllowedLocations = [
              var.primary_location,
              var.secondary_location,
            ]
          }
        }
        access_control = {}
      }
    }
  }
}
