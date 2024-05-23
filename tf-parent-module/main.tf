module "naming" {
  source = "../tf-naming-module"  

  for_each = var.resources

  base_name     = each.key
  resource_type = each.value
}

# Create output variables per resource
resource "null_resource" "outputs" {
  for_each = var.resources

  provisioner "local-exec" {
    command = "echo 'resource_name for ${each.key} is ${module.naming[each.key].resource_name}'"
  }
}
