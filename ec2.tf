resource "aws_instance" "app_server" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t2.micro" # t2.micro is often eligible for the AWS Free Tier

  tags = {
    Name = "terraform-ec2-instance"
    project="roboshop"
  }
}