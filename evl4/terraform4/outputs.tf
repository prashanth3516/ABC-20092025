output "vnet_id" {
  description = "The ID of the created virtual network"
  value       = module.network.vnet_id
}

output "subnet_id" {
  description = "The ID of the created subnet"
  value       = module.network.subnet_id
}

