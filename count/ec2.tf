resource "aws_instance" "app_server" {
    #count=10
    count=length(var.instances)
    ami="ami-0220d79f3f480ecf5"
    instance_type="t3.micro"
    vpc_security_group_ids= [aws_security_group.allow_web_traffic.id]

    tags={
        #Name="mongodb"
        Name=var.instances[count.index]
        project="roboshop"
    }
}

resource "aws_security_group" "allow_web_traffic"{
    name="allow_everyone"
    description="Allow web traffic and SSH"
    ingress {
        from_port = 0
        to_port = 0
        protocol ="-1"
        cidr_blocks=["0.0.0.0/0"]
    }
    egress {
        from_port=0
        to_port=0
        protocol="-1"
        cidr_blocks=["0.0.0.0/0"]
    }
}