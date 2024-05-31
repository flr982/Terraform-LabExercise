output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.example.id
}

output "instance_private_ip" {
  description = "The private IP address of the EC2 instance"
  value       = aws_instance.example.private_ip
}
