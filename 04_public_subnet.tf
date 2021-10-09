resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_subnet_cidr_block
  tags = {
    Name = var.tag_public_subnet
  }
}