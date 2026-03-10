resource "aws_instance" "app_server"{
    ami="ami-0220d79f3f480ecf5"
    instance_type=var.instance_type
    vpc_security_group_ids=[aws_security_group.all.id]

    provisioner "local-exec"{
        command = "echo ${aws_instance.app_server.public_ip} > inventory.ini"
    
    }
    provisioner "local-exec"{
        command = "echo script2 "
    }
   
    provisioner "local-exec"{
        when=destroy
        command = "echo > inventory.ini" 
        
    }

    connection{
        type="ssh"
        user="ec2-user"
        password="DevOps321"
        host=self.public_ip
    }

    provisioner "remote-exec"{
        inline=[
            "sudo dnf install nginx -y",
            "sudo systemctl start nginx"
        ]
    }
    provisioner "remote-exec"{
        inline=[
            "sudo systemctl stop nginx"
        ]
        when = destroy
    }

    tags={
        Name="provisioner-terra-1"
        project="terraform"
    }
}
resource "aws_security_group" "all"{
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