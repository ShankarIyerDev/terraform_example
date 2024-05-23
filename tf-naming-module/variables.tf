variable "base_name" {
  description = "Base name as an input, used to name resources."
  type        = string
}

variable "resource_type" {
  description = "Resource type to decide how to generate the base name. Must be one of 'virtual_machine', 'key_vault', or 'storage_account'."
  type        = string
  validation {
    condition     = contains(["virtual_machine", "key_vault", "storage_account"], var.resource_type)
    error_message = "resource_type must be one of 'virtual_machine', 'key_vault', or 'storage_account'."
  }
}
