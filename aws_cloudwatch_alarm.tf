resource "aws_cloudwatch_metric_alarm" "insufficiantCapacityErrorAlarm" {
  alarm_name                = join("_",["${var.FleetName}", "InsufficiantCapacityErrorAlarm_"])
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = "1"
  metric_name               = "InsufficiantCapacityError"
  namespace                 = "AWS\\Appstream"
  period                    = var.PeriodInsufficientCapacityError
  statistic                 = var.StatisticInsufficientCapacityErrorAlarm
  threshold                 = 1
  actions_enabled           = "true"
  unit                      = "None"
  dimensions = {
    Fleet  = var.FleetName
  }
  alarm_description         = "The number of session requests rejected due to lack ofPeriodCapacityUtilization capacity"
depends_on = [aws_appstream_fleet.fleet]
}


resource "aws_cloudwatch_metric_alarm" "capacityUtilizationAlarm" {
  alarm_name                = join("_",["${var.FleetName}", "CapacityUtilizationAlarm"])
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = "1"
  metric_name               = "CapacityUtilization"
  namespace                 = "AWS\\Appstream"
  period                    = 60
  statistic                 = "Average"
  threshold                 = var.CapacityUtilizationThreshold
  actions_enabled           = "true"
  unit                      = "None"
  alarm_description         = "The percentage of instances in a fleet that are being used, using the following formula. CapacityUtilization = (InUseCapacity/ActualCapacity) * 100"
depends_on = [aws_appstream_fleet.fleet]
}


resource "aws_cloudwatch_metric_alarm" "cloudWatchAlarmUp" {
  alarm_name                = join("_",["${var.FleetName}", "ALARM_UP"])
  comparison_operator       = "LessThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "AvailableCapacity"
  namespace                 = "AWS\\Appstream"
  period                    = 60
  statistic                 = "Average"
  threshold                 = var.FleetScaleUpAlarmThreshold
  unit                      = "Count/Second"
  alarm_description         = "AlarmPolicyUP"
  alarm_actions             = [aws_appautoscaling_policy.scalingPolicyUp.arn]
depends_on = [aws_appstream_fleet.fleet]
}



resource "aws_cloudwatch_metric_alarm" "cloudWatchAlarmDown" {
  alarm_name                = join("_",["${var.FleetName}", "ALARM_DOWN"])
  comparison_operator       = "LessThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "AvailableCapacity"
  namespace                 = "AWS\\Appstream"
  period                    = 60
  statistic                 = "Average"
  threshold                 = var.FleetScaleDownAlarmThreshold
  unit                      = "Count/Second"
  alarm_description         = "AlarmPolicyDown"
  alarm_actions             = [aws_appautoscaling_policy.scalingPolicyDown.arn]
depends_on = [aws_appstream_fleet.fleet]
}

