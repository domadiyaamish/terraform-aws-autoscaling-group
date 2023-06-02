provider "aws" {
  region = "ap-south-1"
}
resource "aws_launch_template" "launch" {
  name_prefix   = "launch"
  image_id      = "ami-0f5ee92e2d63afc18"
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "bar" {
  availability_zones = ["ap-south-1a" , "ap-south-1b" , "ap-south-1c"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1

  launch_template {
    id      = aws_launch_template.launch.id
    version = "$Latest"
  }
}