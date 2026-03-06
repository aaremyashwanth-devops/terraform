variable "instance-list"{
    default={
        mongobd="t3.micro",
        cart="t3.micro"
        catalogue="t3.small"

    }
}

variable "zone_id"{
    default="Z017691837EJOVFVM6G3X"
}
variable "domain"{
    default="yashwanthaarem.in"
}