# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
provider "azurerm" {
version = "=2.0"
features {}
}

# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = "vnet-test-rg"
  location = "West Europe"
}

# Create a virtual network within the newly created resource group.
resource "azurerm_virtual_network" "example" {
  name                = "virtualnetwork-test01"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  address_space       = ["10.0.0.0/16"]
}