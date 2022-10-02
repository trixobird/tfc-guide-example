output "instance_ami" {
  value = aws_instance.amazonlinux.ami
}

output "instance_arn" {
  value = aws_instance.amazonlinux.arn
}
