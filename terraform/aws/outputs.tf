output "instance_id" {
  value = aws_instance.kubernetes.id
}

output "public_ip" {
  value = aws_instance.kubernetes.public_ip
}

output "public_dns" {
  value = aws_instance.kubernetes.public_dns
}

output "vpc_id" {
  value = aws_vpc.main.id
}