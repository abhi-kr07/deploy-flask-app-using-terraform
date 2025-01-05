resource "aws_vpc" "DemoVPC" {
    cidr_block = var.cidr_block_value
}

resource "aws_subnet" "sub1" {
    cidr_block = "10.0.0.0/24"
    availability_zone = "ap-south-1a"
    vpc_id = aws_vpc.DemoVPC.id
    map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.DemoVPC.id
}

resource "aws_route_table" "rt" {
    vpc_id = aws_vpc.DemoVPC.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
  
}

resource "aws_route_table_association" "rt1" {
    subnet_id = aws_subnet.sub1.id
    route_table_id = aws_route_table.rt.id
}

resource "aws_security_group" "my-sg" {
    name = "MySg"
    description = "This security group allow only two port 22 and 80"
    vpc_id = aws_vpc.DemoVPC.id

    ingress {
        cidr_blocks = ["0.0.0.0/0"]
        to_port = "22"
        protocol = "tcp"
        from_port = "22"
    }
    
    ingress {
        cidr_blocks = ["0.0.0.0/0"]
        to_port = "80"
        protocol = "tcp"
        from_port = "80"
    }

    egress {
        cidr_blocks = ["0.0.0.0/0"]
        to_port = "0"
        protocol = "-1"
        from_port = "0"
    }
}
