variable "ami_id"{
    default="ami-0220d79f3f480ecf5"
}

variable "instance_type"{
    default="t3.micro"
}

variable "ec2-tags"{
    default={
        Name="terraform-ec2-instance"
        project="roboshop"
        environment="dev"

    }
}

variable "environment"{
    default="prod"
}

variable "sg_name"{
    type=string
}