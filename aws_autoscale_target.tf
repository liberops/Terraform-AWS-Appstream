resource "aws_appautoscaling_target" "ScalableTarget" {
  max_capacity       = var.FleetMaxCapacity
  min_capacity       = var.FleetMinCapacity
  role_arn           = join("",["arn:aws:iam::", "${data.aws_caller_identity.current.account_id}", ":role/aws-service-role/appstream.application-autoscaling.amazonaws.com/AWSServiceRoleForApplicationAutoScaling_AppStreamFleet"])
  resource_id        = "fleet/${var.FleetName}"
  scalable_dimension = "appstream:fleet:DesiredCapacity"
  service_namespace  = "appstream"
depends_on = [aws_appstream_fleet.fleet]
}