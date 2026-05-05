output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.my_instance.public_ip
}

output "instance_id" {
  description = "Instance ID of the EC2 instance"
  value       = aws_instance.my_instance.id
}

output "instance_state" {
  description = "Current state of the EC2 instance"
  value       = aws_instance.my_instance.instance_state
}
