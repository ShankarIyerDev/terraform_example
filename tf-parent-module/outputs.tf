output "resource_name_map" {
  description = "A map of the generated resource names."
  value = { for k, v in var.resources : k => module.naming[k].resource_name }
}
