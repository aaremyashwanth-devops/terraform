resource "aws_instance" "app_server" {
    ami = "ami-0220d79f3f480ecf5"
    instance_type="t3.micro"
    vpc_security_group_ids=[aws_security_group.all_traffic.id]
    tags={
        Name="roboshop"
        project="terraform"
    }
}

resource "aws_security_group" "all_traffic"{
    name=""
    description=""
    ingress{
        to_port=0
        from_port=0
        protocol="-1"
        cidr_blocks=["0.0.0.0/0"]
    }
    egress{
        to_port=0
        from_port=0
        protocol="-1"
        cidr_blocks=["0.0.0.0/0"]
    }
}