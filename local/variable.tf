variable "ami_id"{
    default="saf"
}
variable "env"{
    default="prod"
}

locals{
    fullname="${var.ami_id}${var.env}"
    
}