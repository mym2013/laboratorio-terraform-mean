output "app_sg_id" {
  value = aws_security_group.app_sg.id
}

output "mongo_sg_id" {
  value = aws_security_group.mongo_sg.id
}

