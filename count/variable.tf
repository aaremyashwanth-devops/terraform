variable "instances"{
    type=list
    default=["mongodb","mysql","rabbitmq","catalogue","cart","user","shipping","payment","redis","frontend"]
}

variable "domain"{
    type=string
    default="yashwanthaarem.in"
}

variable "zone_id"{
    default="Z017691837EJOVFVM6G3X"
}