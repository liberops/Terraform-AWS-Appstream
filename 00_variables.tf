variable "region" {
  type        = string
  description = "AWS region"
  default     = "eu-central-1"
}

variable "tag_VPC" {
  type        = string
  description = "tag_VPC"
  default     = "MyVPC"
}

variable "tag_public_subnet" {
  type        = string
  description = "tag_public_subnet"
  default     = "MyPublicSubnet"
}

variable "tag_internet_gateaway" {
  type        = string
  description = "tag_internet_gateaway"
  default     = "MyGateway"
}

variable "tag_stack" {
  type        = string
  description = "tag_stack"
  default     = "libero-stack"
}

variable "tag_fleet" {
  type        = string
  description = "tag_fleet"
  default     = "libero-fleet"
}

variable "vpc_cidr_block" {
  type        = string
  description = "The VPC CIDR block"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr_block" {
  type        = string
  description = "The public subnet CIDR block"
  default     = "10.0.2.0/24"
}

variable "vpc_enable_dns_support" {
  type        = bool
  description = "vpc_enable_dns_support"
  validation {
    condition = var.vpc_enable_dns_support == true || var.vpc_enable_dns_support == false
    error_message = "The image_id value must be a valid AMI id, starting with\"."
  }
  default     = true
}

variable "vpc_enable_dns_hostnames" {
  type        = bool
  description = "vpc_enable_dns_hostnames"
  validation {
    condition = var.vpc_enable_dns_hostnames == true || var.vpc_enable_dns_hostnames == false
    error_message = "Value sould be true or false\"."
  }
  default     = true
}

variable "FleetName" {
  type        = string
  description = "Fleet name"
  default     = "libero_fleet"
}

variable "StackName" {
  type        = string
  description = "Stack name"
  default     = "libero_stack"
}

variable "StackStorageConnectorHomeFolders" {
  type        = string
  description = "storage_connectors"
  validation {
    condition = var.StackStorageConnectorHomeFolders == "HOMEFOLDERS" || var.StackStorageConnectorHomeFolders == "GOOGLE_DRIVE" || var.StackStorageConnectorHomeFolders == "ONE_DRIVE"
    error_message = "Value sould be HOMEFOLDERS, GOOGLE_DRIVE or ONE_DRIVE\"."
  }
  default     = "HOMEFOLDERS"
}

variable "StackUserSettingsClipboardFromLocalDevice" {
  type        = string
  description = "Enable or disable CLIPBOARD_COPY_FROM_LOCAL_DEVICE"
  validation {
    condition = var.StackUserSettingsClipboardFromLocalDevice == "CLIPBOARD_COPY_FROM_LOCAL_DEVICE" || var.StackUserSettingsClipboardFromLocalDevice == "CLIPBOARD_COPY_TO_LOCAL_DEVICE" 
    error_message = "Value sould be CLIPBOARD_COPY_FROM_LOCAL_DEVICE\"."
  }
  default     = "CLIPBOARD_COPY_FROM_LOCAL_DEVICE"
}

variable "EnableStackUserSettingsClipboardFromLocalDevice" {
  type        = string
  description = "Enable or disable CLIPBOARD_COPY_FROM_LOCAL_DEVICE"
  validation {
    condition = var.EnableStackUserSettingsClipboardFromLocalDevice == "ENABLED" || var.EnableStackUserSettingsClipboardFromLocalDevice == "DISABLED"
    error_message = "Value sould be ENABLED or DISABLED\"."
  }
  default     = "DISABLED"
}

variable "StackUserSettingsClipboardToLocalDevice" {
  type        = string
  description = "Enable or disable CLIPBOARD_COPY_TO_LOCAL_DEVICE"
  validation {
    condition = var.StackUserSettingsClipboardToLocalDevice == "CLIPBOARD_COPY_TO_LOCAL_DEVICE"
    error_message = "Value sould be CLIPBOARD_COPY_TO_LOCAL_DEVICE\"."
  }
  default     = "CLIPBOARD_COPY_TO_LOCAL_DEVICE"
}

variable "EnableStackUserSettingsClipboardToLocalDevice" {
  type        = string
  description = "Enable or disable CLIPBOARD_COPY_TO_LOCAL_DEVICE"
  validation {
    condition = var.EnableStackUserSettingsClipboardToLocalDevice == "ENABLED" || var.EnableStackUserSettingsClipboardToLocalDevice == "DISABLED"
    error_message = "Value sould be ENABLED or DISABLED\"."
  }
  default     = "DISABLED"
}

variable "StackUserSettingsFileUpload" {
  type        = string
  description = "Enable or disable FILE_UPLOAD"
  validation {
    condition = var.StackUserSettingsFileUpload == "FILE_UPLOAD"
    error_message = "Value sould be FILE_UPLOAD\"."
  }
  default     = "FILE_UPLOAD"
}

variable "EnableStackUserSettingsFileUpload" {
  type        = string
  description = "Enable or disable FILE_UPLOAD"
  validation {
    condition = var.EnableStackUserSettingsFileUpload == "ENABLED" || var.EnableStackUserSettingsFileUpload == "DISABLED"
    error_message = "Value sould be ENABLED or DISABLED\"."
  }
  default     = "DISABLED"
}

variable "StackUserSettingsFileDownload" {
  type        = string
  description = "Enable or disable FILE_DOWNLOAD"
  validation {
    condition = var.StackUserSettingsFileDownload == "FILE_DOWNLOAD"
    error_message = "Value sould be FILE_DOWNLOAD\"."
  }
  default     = "FILE_DOWNLOAD"
}

variable "EnableStackUserSettingsFileDownload" {
  type        = string
  description = "Enable or disable FILE_DOWNLOAD"
  validation {
    condition = var.EnableStackUserSettingsFileDownload == "ENABLED" || var.EnableStackUserSettingsFileDownload == "DISABLED"
    error_message = "Value sould be ENABLED or DISABLED\"."
  }
  default     = "DISABLED"
}

variable "StackUserSettingsPrintingToLocalDevice" {
  type        = string
  description = "Enable or disable PRINTING_TO_LOCAL_DEVICE"
  validation {
    condition = var.StackUserSettingsPrintingToLocalDevice == "PRINTING_TO_LOCAL_DEVICE"
    error_message = "Value sould be PRINTING_TO_LOCAL_DEVICE\"."
  }
  default     = "PRINTING_TO_LOCAL_DEVICE"
}

variable "EnableStackUserSettingsPrintingToLocalDevice" {
  type        = string
  description = "Enable or disable PRINTING_TO_LOCAL_DEVICE"
  validation {
    condition = var.EnableStackUserSettingsPrintingToLocalDevice == "ENABLED" || var.EnableStackUserSettingsPrintingToLocalDevice == "DISABLED"
    error_message = "Value sould be ENABLED or DISABLED\"."
  }
  default     = "DISABLED"
}

variable "StackApplicationSettings" {
  type        = bool
  description = "Enable or disable application persistence for this stack"
  validation {
    condition = var.StackApplicationSettings == true || var.StackApplicationSettings == false
    error_message = "Value sould be true or false\"."
  }
  default     = true
}

variable "application_settings_settings_group" {
  type        = string
  description = "user_settings_permission4"
  default     = "SettingsGroup"
}

variable "stream_view" {
  type        = string
  description = "stream_view"
  validation {
    condition = var.stream_view == "APP" || var.stream_view == "DESKTOP"
    error_message = "Value sould be APP or DESKTOP\"."
  }
  default     = "DESKTOP"
}

variable "FleetDesiredCapacity" {
  type        = number
  description = "Desired capacity of the fleet"
  default     = 2
}

variable "FleetIdleDisconnectTimeoutInSeconds" {
  type        = number
  description = "The amount of time that users can be idle (inactive) before they are disconnected from their streaming session and the DisconnectTimeoutInSeconds time interval begins, enter 0 if you want to disable it, Specify a value between 60 and 3600"
  validation {
    condition = min(var.FleetIdleDisconnectTimeoutInSeconds) > 0 || max(var.FleetIdleDisconnectTimeoutInSeconds) > 3600
    error_message = "Value sould be >0 or <3600\"."
  }
  default     = 60
}

variable "enable_default_internet_access" {
  type        = bool
  description = "enable_default_internet_access"
  validation {
    condition = var.enable_default_internet_access == true || var.enable_default_internet_access == false
    error_message = "Value sould be true or false\"."
  }
  default     = true
}

variable "FleetType" {
  type        = string
  description = "ON_DEMAND' you have to wait 2 min before using your app (butcheaper) or 'ALWAYS_ON' app available instantly (cost more)"
  validation {
    condition = var.FleetType == "ON_DEMAND" || var.FleetType == "ALWAYS_ON"
    error_message = "Value sould be ON_DEMAND or ALWAYS_ON\"."
  }
  default     = "ON_DEMAND"
}

variable "FleetImageName" {
  type        = string
  description = "Name of the source image to use on Appstream instances on this Fleet"
  default     = "Amazon-AppStream2-Sample-Image-02-04-2019"
}

variable "FleetInstanceType" {
  type        = string
  description = "Fleet instance type, define specification of your instance (CPU, RAM, GPU), this must match your image type"
  validation {
    condition = var.FleetInstanceType == "stream.standard.medium" || var.FleetInstanceType == "stream.standard.large" || var.FleetInstanceType == "stream.compute.large" || var.FleetInstanceType == "stream.compute.xlarge" || var.FleetInstanceType == "stream.compute.2xlarge" || var.FleetInstanceType == "stream.compute.4xlarge" || var.FleetInstanceType == "stream.compute.8xlarge" || var.FleetInstanceType == "stream.memory.large" || var.FleetInstanceType == "stream.memory.xlarge" || var.FleetInstanceType == "stream.memory.2xlarge" || var.FleetInstanceType == "stream.memory.4xlarge" || var.FleetInstanceType == "stream.memory.8xlarge" || var.FleetInstanceType == "stream.graphics-design.large" || var.FleetInstanceType == "stream.graphics-design.xlarge" || var.FleetInstanceType == "stream.graphics-design.2xlarge" || var.FleetInstanceType == "stream.graphics-design.4xlarge" || var.FleetInstanceType == "stream.graphics-desktop.2xlarge" || var.FleetInstanceType == "stream.graphics-pro.4xlarge" || var.FleetInstanceType == "stream.graphics-pro.8xlarge" || var.FleetInstanceType == "stream.graphics-pro.16xlarge" || var.FleetInstanceType == "stream.graphics.g4dn.xlarge" 
    error_message = "Value sould be stream.standard.medium, stream.standard.large, stream.compute.large, stream.compute.xlarge, stream.compute.2xlarge, stream.compute.4xlarge, stream.compute.8xlarge, stream.memory.large, stream.memory.xlarge, stream.memory.2xlarge, stream.memory.4xlarge, stream.memory.8xlarge, stream.graphics-design.large, stream.graphics-design.xlarge, stream.graphics-design.2xlarge, stream.graphics-design.4xlarge, stream.graphics-desktop.2xlarge, stream.graphics-pro.4xlarge, stream.graphics-pro.8xlarge, stream.graphics-pro.16xlarge, stream.graphics.g4dn.xlarge\"."
  }
  default     = "stream.standard.medium"
}

variable "FleetMaxUserDurationInSeconds" {
  type        = number
  description = "The maximum amount of time that a streaming session can remain active, in seconds, Specify a value between 600 and 360000"
  validation {
    condition = min(var.FleetMaxUserDurationInSeconds) > 600 || max(var.FleetMaxUserDurationInSeconds) < 360000
    error_message = "Value sould be >600 or <360000\"."
  }
  default     = 28800
}

variable "FleetMinCapacity" {
  description = "Minimum of instances running in this fleet"
  type        = number
  default     = 1
}
variable "FleetMaxCapacity" {
  description = "Maximum of instances running in this fleet"
  type        = number
  default     = 3
}
  
variable "FleetImageSourceAccountID" {
  description = "[OPTIONAL] ID of the AWS Account sharing an image with you, leave blank if you use your own or public images"
  type        = string
  default     = ""
}
variable "FleetAutoStart" {
  description = "Start automatically the Fleet after cloudformation template deployment, only set it to true if you already have the image for this Fleet"
  type        = bool
  validation {
    condition = var.FleetAutoStart == true || var.FleetAutoStart == false
    error_message = "Value sould be true or false\"."
  }
  default     = false
}

#variable "FleetSubnetID1" {
  #description = "Subnet ID that will host the instances, Subnet one"
  #Type: 'AWS::EC2::Subnet::Id'
#}
#variable "FleetSubnetID2" {
  #description = "Subnet ID that will host the instances, Subnet two"
  #Type: 'AWS::EC2::Subnet::Id'
#}
variable "FleetDisconnectTimeoutInSeconds" {
  description = "The amount of time that a streaming session remains active after users disconnect, Specify a value between 60 and 360000"
  type        = number
  validation {
    condition = min(var.FleetDisconnectTimeoutInSeconds) > 60 || max(var.FleetDisconnectTimeoutInSeconds) > 360000
    error_message = "Value sould be >60 or <360000\"."
  }
  default     = 25200
}  

variable "FleetSchedule" {
  description = "Define schedule periods with cron expressions in the following order working hours; night; weekend, reference time is UTC"
  type        = string
  default     = "cron(0 7 ? * MON-FRI *);cron(0 17 ? * MON-THU *);cron(0 17 ? * FRI-MON *)"
}
variable "FleetScheduleName" {
  description = "Names of schedule Objects in the following order working hours; night; weekend"
  type        = string
  default     = "Week Schedule;Night Schedule;WeekEnd Schedule"
}
variable "FleetScheduleMinCapacity" {
  description = "Minimum of instances running in this fleet during specific schedule (Working hours;Night hours;Weekend hours)"
  type        = string
  default     = "1;0;0"
}
variable "FleetScheduleMaxCapacity" {
  description = "Maximum of instances running in this fleet during specific schedule (Working hours;Night hours;Weekend hours)"
  type        = string
  default     = "3;0;0"
}
variable "FleetScaleUpAlarmThreshold" {
  description = "Minimum of instances that will trigger an Up alarm"
  type        = number
  default     = 1
}
variable "FleetScaleUpPolicyAdjustment" {
  description = "Number of instances to add when ScaleUp Alarm is triggered"
  type        = number
  default     = 2
}
variable "FleetScaleDownAlarmThreshold" {
  description = "Maximum of instances that will trigger a Down alarm"
  type        = number
  default     = 3
}    
variable "FleetScaleDownPolicyAdjustment" {
  description = "Number of instances to remove (negative value) when ScaleDown Alarm is triggered"
  type        = number
  default     = -1
}


#variable "FleetImageDomainJoinEnabled" {
  #description = "Enable the fleet DomainJoin configuration"
  #type = bool
#}

variable "FleetDomainJoinDirectoryName" {
  description = "The fully qualified name of the directory (for example, corp.example.com)"
  type        = string
  default     = " "
}

variable "FleetDomainJoinOU" {
  description = "The distinguished name of the organizational unit for computer accounts (for example, OU=Appstream,DC=corp,DC=example,DC=com)"
  type        = string
  default     = " "
}

#N'EST PAS A CONFIGURER
#variable "FleetVPCID" {
  #description = "ID of the VPC that will host the instances, must be the same VPC ID than the one hosting FleetSubnetID1 and FleetSubnetID2"
#}

variable "FleetSecurityGroupID" {
  description = " Security group ID, this security group is associated with your fleet instances"
}


variable "FleetSubnetID1" {
    description = "Subnet ID that will host the instances, Subnet one"
    type = string
}

variable "FleetSubnetID2" {
    description = "Subnet ID that will host the instances, Subnet two"
    type = string
}
 
variable "FleetRoleName" {
  description = "IAM Role name used by the Fleet"
  type        = string
  default     = ""
}

variable "RoleName" {
  description = "IAM Role name used by the end user to access the Stack"
  type        = string
  default     = "stack_end_users_access"
}

variable "PolicyName" {
  description = "IAM Policy name, atteched to the IAM Role used by the end user"
  type        = string
  default     = "appstream_policy"
}

variable "IDPProviderName" {
  description = "Name of the AWS IDP used to access the stack"
  type        = string
  default     = "Google"
}

variable "StatisticInsufficientCapacityErrorAlarm" {
  description = "The statistic for the metric specified in MetricName, other than percentile. For percentile statistics, use ExtendedStatistic. When you call PutMetricAlarm and specify a MetricName, you must specify either Statistic or ExtendedStatistic, but not both"
  type        = string
}

variable "PeriodInsufficientCapacityError" {
  description = "The length, in seconds, used each time the metric specified in MetricName is evaluated. Valid values are 10, 30, and any multiple of 60"
  type        = number
}

variable "CapacityUtilizationThreshold" {
  description = "The percentage of instances in a fleet that are being used for trigger"
  type        = number
}

variable "PeriodCapacityUtilization" {
  description = "The length, in seconds, used each time the metric specified in MetricName is evaluated. Valid values are 10, 30, and any multiple of 60"
  type        = number
}

variable "StatisticCapacityUtilization" {
  description = "The statistic for the metric specified in MetricName, other than percentile. For percentile statistics, use ExtendedStatistic. When you call PutMetricAlarm and specify a MetricName, you must specify either Statistic or ExtendedStatistic, but not both"
  type        = string
}

