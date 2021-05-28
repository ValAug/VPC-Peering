#---root/main---

resource "aws_vpc" "vpc_A" {
  cidr_block = "10.16.0.0/16"

  tags = {
    Name = "VPC_A"
  }

}

resource "aws_vpc" "vpc_B" {
  cidr_block = "10.32.0.0/16"

  tags = {
    Name = "VPC_B"
  }
}

resource "aws_vpc" "vpc_C" {
  cidr_block = "10.48.0.0/16"

  tags = {
    Name = "VPC_C"
  }
}

resource "aws_vpc_peering_connection" "peering_connection_one" {
  peer_vpc_id = aws_vpc.vpc_A.id #Accepter
  vpc_id      = aws_vpc.vpc_B.id #Requester
  auto_accept = true

  tags = {
    Name = "VPC Peering between A and B"

  }
}

resource "aws_vpc_peering_connection_accepter" "accepter_connection_one" {
  vpc_peering_connection_id = aws_vpc_peering_connection.peering_connection_one.id
  auto_accept               = true

  tags = {
    Side = "VPC Peering A Accepter"

  }

}

resource "aws_vpc_peering_connection" "peering_connection_two" {
  peer_vpc_id = aws_vpc.vpc_A.id #Accepter
  vpc_id      = aws_vpc.vpc_C.id #Requester
  auto_accept = true

  tags = {
    Name = "VPC Peering between A and C"

  }
}

resource "aws_vpc_peering_connection_accepter" "accepter_connection_two" {
  vpc_peering_connection_id = aws_vpc_peering_connection.peering_connection_two.id
  auto_accept               = true

  tags = {
    Side = "VPC Peering A Accepter"

  }

}