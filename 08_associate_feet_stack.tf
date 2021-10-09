resource "appstream_stack_attachment" "stack_fleet_association" {
  appstream_stack_id = aws_appstream_stack.stack.name
  appstream_fleet_id = aws_appstream_fleet.fleet.name
depends_on = [aws_appstream_fleet.fleet,aws_appstream_stack.stack]
}