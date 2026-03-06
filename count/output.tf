output "ec2_instances"{
    value=aws_instance.app_server[*].tags["Name"]
}