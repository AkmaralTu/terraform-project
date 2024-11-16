output "instance_ip" {
  value = aws_instance.alibek.public_ip
}

output "ami" {
  value = aws_instance.alibek.ami
}