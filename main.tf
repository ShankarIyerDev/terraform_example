provider "azurerm" {
  features {}
}

module "parent" {
  source = "./tf-parent-module"

  resources = {
    "Example-1-Base-Name" = "virtual_machine",
    "Example-2-Base-Name" = "key_vault",
    "Example-3-Base-Name" = "storage_account"
  }
}

output "generated_names" {
  value = module.parent.resource_name_map
}
