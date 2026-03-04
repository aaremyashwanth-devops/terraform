resource "aws_instance" "app_server"{
    ami=var.ami_id
   # instance_type=var.instance_type
    instance_type=var.environment=="dev"?"t3.micro":"t3.small"
    vpc_security_group_ids=[aws_security_group.allow_web_traffic.id]
    tags=var.ec2-tags
}
resource "aws_security_group" "allow_web_traffic"{
    name =var.sg_name
    description="allow web traffic and SSH"
    #vpc_id=aws_vpc.main.vpc_id
    
    #Inbound Rules
    ingress {
        from_port=0
        to_port=0
        protocol="-1"
        cidr_blocks=["0.0.0.0/0"]
    }

    #... additional ingress rules for 80 ,22
    egress {
        from_port=0
        to_port=0
        protocol="-1"
        cidr_blocks=["0.0.0.0/0"]
    }
}

