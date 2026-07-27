data "azurerm_subnet" "subnet" {
    for_each = var.nics
  name                 = each.value.subnetname
  virtual_network_name = each.value.vnetname
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "pip" {
    for_each = var.nics
  name                = each.value.publicipname
  resource_group_name = each.value.resource_group_name
}