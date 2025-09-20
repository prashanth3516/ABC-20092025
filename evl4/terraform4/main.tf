module "network" {
  source = "git::https://github.com/prashanth3516/ABC-20092025.git"

  resource_group_name = "rg-demo"
  location            = "East US"
  vnet_name           = "vnet-demo"
  subnet_name         = "subnet-demo"
  address_space       = ["10.0.0.0/16"]
  subnet_prefix       = ["10.0.1.0/24"]
}

