output "vm1_public_ip" {
  value = azurerm_public_ip.vm1_public.ip_address
}

output "vm2_private_ip" {
  value = azurerm_network_interface.nic2.private_ip_address
}

