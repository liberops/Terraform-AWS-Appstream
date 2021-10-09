resource "aws_appautoscaling_scheduled_action" "autoscaling_week_schedule" {
  name               = element(split(";", var.FleetScheduleName),0)
  service_namespace  = aws_appautoscaling_target.ScalableTarget.service_namespace
  resource_id        = aws_appautoscaling_target.ScalableTarget.resource_id
  scalable_dimension = aws_appautoscaling_target.ScalableTarget.scalable_dimension
  schedule           = element(split(";", var.FleetSchedule),0)

  scalable_target_action {
    min_capacity = element(split(";", var.FleetScheduleMinCapacity),0)
    max_capacity = element(split(";", var.FleetScheduleMaxCapacity),0)
  }
depends_on = [aws_appstream_fleet.fleet]
}


resource "aws_appautoscaling_scheduled_action" "autoscaling_night_schedule" {
  name               = element(split(";", var.FleetScheduleName),1)
  service_namespace  = aws_appautoscaling_target.ScalableTarget.service_namespace
  resource_id        = aws_appautoscaling_target.ScalableTarget.resource_id
  scalable_dimension = aws_appautoscaling_target.ScalableTarget.scalable_dimension
  schedule           = element(split(";", var.FleetSchedule),1)

  scalable_target_action {
    min_capacity = element(split(";", var.FleetScheduleMinCapacity),1)
    max_capacity = element(split(";", var.FleetScheduleMaxCapacity),1)
  }
depends_on = [aws_appstream_fleet.fleet]
}


resource "aws_appautoscaling_scheduled_action" "autoscaling_weekend_schedule" {
  name               = element(split(";", var.FleetScheduleName),2)
  service_namespace  = aws_appautoscaling_target.ScalableTarget.service_namespace
  resource_id        = aws_appautoscaling_target.ScalableTarget.resource_id
  scalable_dimension = aws_appautoscaling_target.ScalableTarget.scalable_dimension
  schedule           = element(split(";", var.FleetSchedule),2)

  scalable_target_action {
    min_capacity = element(split(";", var.FleetScheduleMinCapacity),2)
    max_capacity = element(split(";", var.FleetScheduleMaxCapacity),2)
  }
depends_on = [aws_appstream_fleet.fleet]
}