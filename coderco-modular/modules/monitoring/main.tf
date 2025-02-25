###############################
# This configuration provisions a Log Analytics Workspace, sets up a Data Collection Rule (DCR), 
# and associates it with a VMSS for centralized monitoring and log collection. 
# It ensures that key metrics, performance data, and logs are sent to Log Analytics for analysis.
###############################

###############################
# Log Analytics Workspace
###############################
resource "azurerm_log_analytics_workspace" "coderco_log_analytics" {
  name                = var.log_analytics_work_space
  resource_group_name = var.resource_group_name
  location            = var.location
  retention_in_days   = 30
  sku                 = var.sku
}

###############################
# Data Collection Rule
###############################
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
      "Microsoft-InsightsMetrics",  # Collects performance metrics
      "Microsoft-Perf",             # Collects performance data (Disk I/O, Network I/O)
      "Microsoft-Event",            # Collects Event logs (system events)
      "Microsoft-Syslog"            # Collects Syslog for Linux-based VMSS
    ]
    destinations = ["vmss-destination-log-analytics"]
  }
}


###############################
# Data Collection Rule Association
###############################
resource "azurerm_monitor_data_collection_rule_association" "coderco_dcr_ass" {
  name                    = var.coderco_dcr_ass
  target_resource_id      = var.vmss_id
  data_collection_rule_id = azurerm_monitor_data_collection_rule.coderco_dcr.id
  description             = "Associating DCR with VMSS"
}
