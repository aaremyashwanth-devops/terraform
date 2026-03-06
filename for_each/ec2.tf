resource "aws_instance" "app_server"{
#count=length(var.instance-list)
for_each=var.instance-list
ami="ami-0220d79f3f480ecf5"
instance_type=each.value
vpc_security_group_ids=[aws_security_group.allow_everyone.id]

tags={
    project="terraform-ec2-instance"
    Name=each.key
}
}
resource "aws_security_group" "allow_everyone"{
ingress{
from_port=0
to_port=0
protocol="1"
cidr_blocks=["0.0.0.0/0"]
}

egress{
from_port=0
to_port=0
protocol="1"
cidr_blocks=["0.0.0.0/0"]
}
}
