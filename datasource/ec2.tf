resource "aws_instance" "app_server"{
    ami="ami-0220d79f3f480ecf5"
    instance_type="t3.micro"
    vpc_security_group_ids=[aws_security_group.allow-traffic.id]
    #availability_zone = data.aws_availability_zones.available.names[0]
    tags={
        Name="roboshop"
        project="terraform"
    }

}
resource "aws_security_group" "allow-traffic"{
    name="everyone"
    description="allow all"

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