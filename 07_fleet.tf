resource "aws_appstream_fleet" "fleet" {
  name = var.FleetName
  compute_capacity {
    desired_instances = var.FleetDesiredCapacity
  }

  description                        = "Fleet name"
  idle_disconnect_timeout_in_seconds = var.FleetIdleDisconnectTimeoutInSeconds
  disconnect_timeout_in_seconds      = var.FleetDisconnectTimeoutInSeconds
  max_user_duration_in_seconds       = var.FleetMaxUserDurationInSeconds
  display_name                       = var.FleetName
  enable_default_internet_access     = var.enable_default_internet_access
  fleet_type                         = var.FleetType
  #iam_role_arn                       = aws_iam_role..arn
  #image_arn                          =
  image_name                         = var.FleetImageName
  instance_type                      = var.FleetInstanceType
  stream_view                        = var.stream_view
  domain_join_info {
    directory_name = " "
    organizational_unit_distinguished_name = " "
  }
  vpc_config {
    #subnet_ids = [aws_subnet.public-subnet.*.id, var.FleetSubnetID1, var.FleetSubnetID2]
    #security_group_ids = FleetSecurityGroupID
    subnet_ids = aws_subnet.public-subnet.*.id
  }
  tags = {
    TagName = var.tag_fleet
  }
  depends_on = [aws_subnet.public-subnet,aws_route_table.rt_public,aws_internet_gateway.igw]
}