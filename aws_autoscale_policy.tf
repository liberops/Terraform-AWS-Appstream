resource "aws_appautoscaling_policy" "scalingPolicyUp" {
  name               = join("_",["${var.FleetName}", "SCALE_UP"])
  policy_type        = "StepScaling"
  resource_id        = join("",["fleet/", "${var.FleetName}"])
  scalable_dimension = "appstream:fleet:DesiredCapacity"
  service_namespace  = "appstream"

  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown                = 120
    metric_aggregation_type = "Average"

    step_adjustment {
      metric_interval_upper_bound = 0
      scaling_adjustment          = var.FleetScaleUpPolicyAdjustment
    }
  }
depends_on = [aws_appautoscaling_target.ScalableTarget]
}


resource "aws_appautoscaling_policy" "scalingPolicyDown" {
  name               = join("_",["${var.FleetName}", "SCALE_DOWN"])
  policy_type        = "StepScaling"
  resource_id        = join("",["fleet/", "${var.FleetName}"])
  scalable_dimension = "appstream:fleet:DesiredCapacity"
  service_namespace  = "appstream"

  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown                = 120
    metric_aggregation_type = "Average"

    step_adjustment {
      metric_interval_upper_bound = 0
      scaling_adjustment          = var.FleetScaleDownPolicyAdjustment
    }
  }
depends_on = [aws_appautoscaling_target.ScalableTarget]
}