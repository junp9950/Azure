resource "azurerm_monitor_autoscale_setting" "jw_as" {
    name = "jw_autoscale"
    resource_group_name = azurerm_resource_group.jw_rg.name
    location = azurerm_resource_group.jw_rg.location
    target_resource_id = azurerm_linux_virtual_machine_scale_set.jw_vmss.id

    profile {
      name = "jw_proflie"

      capacity {
        default = 2
        minimum = 2
        maximum = 10
      }

      rule {
        metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = azurerm_linux_virtual_machine_scale_set.jw_vmss.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "GreaterThan"
        threshold          = 75
        metric_namespace   = "microsoft.compute/virtualmachinescalesets"
      }

      scale_action {
        direction = "Increase"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT1M"
      }
    }

    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = azurerm_linux_virtual_machine_scale_set.jw_vmss.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "LessThan"
        threshold          = 25
      }
      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT1M"
      }
    }
  }
}