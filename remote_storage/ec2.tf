resource "aws_instance" "app_server" {
    ami="ami-0220d79f3f480ecf5"
    instance_type="t3.micro"
    vpc_security_group_ids=[aws_security_group.allow_all.id]

    tags={
        Name="roboshop_terra"
        project="terraform_roboshop"
    }
}

resource "aws_security_group" "allow_all" {
    name="allow_everyone"
    description="ssh"
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
