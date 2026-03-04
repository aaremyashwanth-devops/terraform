output "instance_type"{
    value=aws_instance.app_server.instance_type
}

output "sg_name_out"{
    value=aws_security_group.allow_web_traffic.name
}