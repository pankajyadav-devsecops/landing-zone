data "azurerm_network_interface" "example" {
    for_each = var.vms
  name                = each.value.data_nic_name
  resource_group_name = each.value.resource_group_name
}