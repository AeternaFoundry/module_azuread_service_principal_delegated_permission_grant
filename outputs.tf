output "service_principal_delegated_permission_grants_id" {
  description = "Map of id values across all service_principal_delegated_permission_grants, keyed the same as var.service_principal_delegated_permission_grants"
  value       = { for k, v in azuread_service_principal_delegated_permission_grant.service_principal_delegated_permission_grants : k => v.id if v.id != null && length(v.id) > 0 }
}
output "service_principal_delegated_permission_grants_claim_values" {
  description = "Map of claim_values values across all service_principal_delegated_permission_grants, keyed the same as var.service_principal_delegated_permission_grants"
  value       = { for k, v in azuread_service_principal_delegated_permission_grant.service_principal_delegated_permission_grants : k => v.claim_values if v.claim_values != null && length(v.claim_values) > 0 }
}
output "service_principal_delegated_permission_grants_resource_service_principal_object_id" {
  description = "Map of resource_service_principal_object_id values across all service_principal_delegated_permission_grants, keyed the same as var.service_principal_delegated_permission_grants"
  value       = { for k, v in azuread_service_principal_delegated_permission_grant.service_principal_delegated_permission_grants : k => v.resource_service_principal_object_id if v.resource_service_principal_object_id != null && length(v.resource_service_principal_object_id) > 0 }
}
output "service_principal_delegated_permission_grants_service_principal_object_id" {
  description = "Map of service_principal_object_id values across all service_principal_delegated_permission_grants, keyed the same as var.service_principal_delegated_permission_grants"
  value       = { for k, v in azuread_service_principal_delegated_permission_grant.service_principal_delegated_permission_grants : k => v.service_principal_object_id if v.service_principal_object_id != null && length(v.service_principal_object_id) > 0 }
}
output "service_principal_delegated_permission_grants_user_object_id" {
  description = "Map of user_object_id values across all service_principal_delegated_permission_grants, keyed the same as var.service_principal_delegated_permission_grants"
  value       = { for k, v in azuread_service_principal_delegated_permission_grant.service_principal_delegated_permission_grants : k => v.user_object_id if v.user_object_id != null && length(v.user_object_id) > 0 }
}

