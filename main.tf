resource "azuread_service_principal_delegated_permission_grant" "service_principal_delegated_permission_grants" {
  for_each = var.service_principal_delegated_permission_grants

  claim_values                         = each.value.claim_values
  resource_service_principal_object_id = each.value.resource_service_principal_object_id
  service_principal_object_id          = each.value.service_principal_object_id
  user_object_id                       = each.value.user_object_id

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      read   = timeouts.value.read
      update = timeouts.value.update
    }
  }
}

