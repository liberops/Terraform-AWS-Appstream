resource "aws_appstream_stack" "stack" {
  name         = var.StackName
  description  = "Stack name"
  display_name = var.StackName

  storage_connectors {
    connector_type = var.StackStorageConnectorHomeFolders
  }
  user_settings {
    action     = var.StackUserSettingsClipboardFromLocalDevice
    permission = var.EnableStackUserSettingsClipboardFromLocalDevice
  }
  user_settings {
    action     = var.StackUserSettingsClipboardToLocalDevice
    permission = var.EnableStackUserSettingsClipboardToLocalDevice
  }
  user_settings {
    action     = var.StackUserSettingsFileDownload
    permission = var.EnableStackUserSettingsFileDownload
  }
  user_settings {
    action     = var.StackUserSettingsFileUpload
    permission = var.EnableStackUserSettingsFileUpload
  }
  user_settings {
    action     = var.StackUserSettingsPrintingToLocalDevice
    permission = var.EnableStackUserSettingsPrintingToLocalDevice
  }
  application_settings {
    enabled        = var.StackApplicationSettings
    settings_group = var.application_settings_settings_group
  }
  tags = {
    TagName = var.tag_stack
  }
depends_on = [aws_appstream_fleet.fleet]
}