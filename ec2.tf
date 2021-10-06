resource "aws_instance" "ec2_test" {
  ami                         = "ami-02892a4ea9bfa2192" # Amazon Linux 2 AMI
  instance_type               = "t2.micro"
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]
  subnet_id                   = aws_subnet.public_subnet1.id
  associate_public_ip_address = true
  ebs_optimized               = true

  tags = {
    Name = "${var.vpc_name}-ec2-test"
  }
}
