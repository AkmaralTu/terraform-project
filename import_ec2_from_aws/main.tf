
resource "aws_instance" "instance" {
    ami = "ami-0453ec754f44f9a4a"
    availability_zone = "us-east-1d"
    cpu_core_count = 1
    cpu_threads_per_core = 1
    instance_type = "t2.micro"
    tags = {
    Name = "manuallu-created-ec2"
  }
}