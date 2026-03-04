resource "aws_instance" "app_server" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro" # t2.micro is often eligible for the AWS Free Tier
  vpc_security_group_ids    = [aws_security_group.allow_web_traffic.id]

  tags = {
    Name = "terraform-ec2-instance"
    project="roboshop"
  }
}

resource "aws_security_group" "allow_web_traffic" {
  name        = "allow_everyone"
  description = "Allow web traffic and SSH"
  #vpc_id      = aws_vpc.main.id

  # Inbound Rules
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # ... additional ingress rules for 80, 22
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
