resource "aws_route_table" "rt_public" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "MyPublic_Route_Table"
  }
}

resource "aws_route_table_association" "rta_public" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.rt_public.id
}
