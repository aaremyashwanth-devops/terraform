resource "aws_instance" "app_server"{
    ami="ami-0220d79f3f480ecf5"
    instance_type="t3.micro"
    vpc_security_group_ids=[aws_security_group.allow_web.id]
    tags={
        name="terraform"
        project="roboshop"
    }

}

resource "aws_security_group" "allow_web" {
    name="allow_everyone"
    dynamic "ingress"{
        for_each=var.traffic
        content{
        from_port=ingress.value.port
        to_port=ingress.value.port
        protocol="tcp"
        cidr_blocks=ingress.value.cidr_blocks
        }
        
    }
    egress{
        from_port=0
        to_port=0
        protocol="-1"
        cidr_blocks=["0.0.0.0/0"]
    }
}