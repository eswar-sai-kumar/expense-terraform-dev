resource "aws_instance" "jenkins" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.small"
  subnet_id              = "subnet-026fa8e1dc737230f"
  vpc_security_group_ids = ["sg-0fb4314a3e3c19b76"]
  associate_public_ip_address = true
}
output "ec2_public_ip" {
  value = aws_instance.my_ec2.public_ip
}