# Assignment: Setup the "resource_type" to only allow the values of "virtual_machine", "key_vault", and "storage_account"
# If the resource_type is "virtual_machine" you should take the "base_name" and append "vm-" to the front of it and "-00" to the back. 
# If the base name and and values you're appending are greater than 15 characters,
#  you should truncate the "base_name" only in order to be 15 characters when combined with your additional characters. 
#  Note that the base_name can be greater than 15 characters.
# If the resource_type is "key_vault" you should append "kv-" to the front of "base_name" and then set all characters to lower case.
# If the resource_type is "storage_account" you should append "sa" to the front of "base_name,
#  and then remove all "-" from the name and then set all characters to lower case.

locals {
  truncated_base_name = substr(var.base_name, 0, 15)

  # Verify proper formats to classify resource types
  resource_name = (
    var.resource_type == "virtual_machine" ? format("vm-%s-00", substr(local.truncated_base_name, 0, 9)) :
    var.resource_type == "key_vault"       ? lower(format("kv-%s", substr(local.truncated_base_name, 0, 12))) :
    var.resource_type == "storage_account" ? substr(lower(replace(format("sa%s", local.truncated_base_name), "-", "")), 0, 15) :
    null
  )
}

# var.resource_type == "virtual_machine" ? format("vm-%s-00", substr(local.truncated_base_name, 0, 9))
#  First checks for the value equivalent to "virtual_machine"
#   Outputs format "vm-[basename]-00"
#   %s = substring, adjusting total size of resource_name to 15 characters, accounting for "vm-" and "-00"

# var.resource_type == "key_vault"       ? substr(lower(format("kv-%s", local.truncated_base_name)), 0, 15) 
#  Adds "kv-" to the truncated base_name (first 12 characters) and sets all to lowercase.

# var.resource_type == "storage_account" ? substr(lower(replace(format("sa%s", local.truncated_base_name), "-", "")), 0, 15)
#  Adds "sa" to the truncated base_name, removes all dashes, sets all to lowercase, and grabs the first 15 characters of the resulting string.


