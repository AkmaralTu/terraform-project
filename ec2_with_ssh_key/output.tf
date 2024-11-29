output "public_ip" {
  value = aws_instance.ec2.public_ip  #ssh -i /path/to/my-key-pair.pem ec2-user@<public-ip>

}