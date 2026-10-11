variable "service_principal_delegated_permission_grants" {
  description = <<EOT
Map of service_principal_delegated_permission_grants, attributes below
Required:
    - claim_values
    - resource_service_principal_object_id
    - service_principal_object_id
Optional:
    - user_object_id
EOT

  type = map(object({
    claim_values                         = set(string)
    resource_service_principal_object_id = string
    service_principal_object_id          = string
    user_object_id                       = optional(string)
  }))
  validation {
    condition = alltrue([
      for k, v in var.service_principal_delegated_permission_grants : (
        alltrue([for x in v.claim_values : length(x) > 0])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.service_principal_delegated_permission_grants : (
        can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", v.resource_service_principal_object_id))
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.service_principal_delegated_permission_grants : (
        can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", v.service_principal_object_id))
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.service_principal_delegated_permission_grants : (
        v.user_object_id == null || (can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", v.user_object_id)))
      )
    ])
    error_message = "must be a valid UUID"
  }
}

