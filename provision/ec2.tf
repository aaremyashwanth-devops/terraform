resource "aws_instance" "app_server"{
    ami="ami-0220d79f3f480ecf5"
    instance_type=var.instance_type
    vpc_security_group_ids=[aws_security_group.all_all.id]

    provisioner "local-exec"{
        command = "echo ${self.public_ip} > inventory.ini"
        
    }
    provisioner "local-exec"{
        command = "echo script2 "
    }
   
    provisioner "local-exec"{
        when=destroy
        command = "echo > inventory.ini" 
        
    }

    tags={
        Name="provisioner-terra-2"
        project="terraform"
    }
}
resource "aws_security_group" "all_all"{
    name="allow_web_traffic"
    description="allow_everyone"
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