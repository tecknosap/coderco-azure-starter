# Log Analytics Workspace
# Stores logs and metrics for analysis.
resource "azurerm_log_analytics_workspace" "coderco_log_analytics" {
  name                = var.log_analytics_work_space
  resource_group_name = var.resource_group_name
  location            = var.location
  retention_in_days   = 30
  sku                 = var.sku
}

# Data Collection Rule
# Defines data sources and destinations for log collection.
resource "azurerm_monitor_data_collection_rule" "coderco_dcr" {
  name                = var.data_collection_rule_name
  resource_group_name = var.resource_group_name
  location            = var.location

  destinations {
    log_analytics {
      name                  = "vmss-destination-log-analytics"
      workspace_resource_id = azurerm_log_analytics_workspace.coderco_log_analytics.id
    }
  }

  data_flow {
    streams = [
      "Microsoft-InsightsMetrics",  # Performance metrics
      "Microsoft-Perf",             # Disk & Network I/O data
      "Microsoft-Event",            # System event logs
      "Microsoft-Syslog"            # Syslog for Linux VMSS
    ]
    destinations = ["vmss-destination-log-analytics"]
  }
}

# Data Collection Rule Association
# Links the DCR to a VMSS for log collection.
resource "azurerm_monitor_data_collection_rule_association" "coderco_dcr_ass" {
  name                    = var.coderco_dcr_ass
  target_resource_id      = var.vmss_id
  data_collection_rule_id = azurerm_monitor_data_collection_rule.coderco_dcr.id
  description             = "Associating DCR with VMSS"
}
