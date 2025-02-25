###############################
# VMSS ID Output
# Outputs the ID of the Virtual Machine Scale Set (VMSS).
# This ID can be used to reference the VMSS in other modules or configurations.
###############################
output "vmss_id" {
  value = azurerm_linux_virtual_machine_scale_set.coderco_vmss.id
}
