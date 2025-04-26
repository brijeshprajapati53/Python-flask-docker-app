provider "azurerm" {
  features {}
  subscription_id = "c1ff822a-8d32-49f1-b97a-89c2b2a1b55e"
}

resource "azurerm_resource_group" "exam" {
  name     = "examResourceGroup"
  location = "East US"
}

resource "azurerm_virtual_network" "exam_vnet" {
  name                = "examVNet"
  location            = azurerm_resource_group.exam.location
  resource_group_name = azurerm_resource_group.exam.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "exam_subnet" {
  name                 = "examSubnet"
  resource_group_name  = azurerm_resource_group.exam.name
  virtual_network_name = azurerm_virtual_network.exam_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

