resource "azurerm_public_ip" "vm1_public" {
  name                = "vm1-public-ip"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
}

