# Create Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "rg-vnet-peering"
  location = "East US"
}

# VNET 1
resource "azurerm_virtual_network" "vnet1" {
  name                = "vnet-1"
  address_space       = ["10.5.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# VNET 2
resource "azurerm_virtual_network" "vnet2" {
  name                = "vnet-2"
  address_space       = ["10.15.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# VNET Peering from vnet1 to vnet2
resource "azurerm_virtual_network_peering" "peer1to2" {
  name                      = "peer-vnet1-to-vnet2"
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.vnet1.name
  remote_virtual_network_id = azurerm_virtual_network.vnet2.id
  allow_forwarded_traffic   = true
  allow_virtual_network_access = true
}

# VNET Peering from vnet2 to vnet1
resource "azurerm_virtual_network_peering" "peer2to1" {
  name                      = "peer-vnet2-to-vnet1"
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.vnet2.name
  remote_virtual_network_id = azurerm_virtual_network.vnet1.id
  allow_forwarded_traffic   = true
  allow_virtual_network_access = true
}

