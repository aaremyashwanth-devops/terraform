output "datasource_output"{
    value=data.aws_ami.latest_amazon_linux
    description="output_1"
}

output "terra_instances" {
    value=data.aws_instance.terra_ec2
}