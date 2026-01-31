output "vpc_id" {
  description = "ID de la VPC"
  value       = aws_vpc.this.id
}

output "public_subnets" {
  description = "Lista de subnets públicas"
  value = [
    aws_subnet.public_1.id,
    aws_subnet.public_2.id
  ]
}
