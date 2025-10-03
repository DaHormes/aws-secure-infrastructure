#########################################
# OUTPUTS - IMPORTANT INFORMATION
#########################################

# VPC Information
output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "vpc_cidr" {
  description = "CIDR block of the VPC"
  value       = aws_vpc.main.cidr_block
}

# Web Server Information
output "web_server_public_ip" {
  description = "Public IP address of the web server"
  value       = aws_instance.web.public_ip
}

output "web_server_url" {
  description = "URL to access the web server"
  value       = "http://${aws_instance.web.public_ip}"
}

# App Server Information
output "app_server_private_ip" {
  description = "Private IP address of the app server"
  value       = aws_instance.app.private_ip
}

# Database Information
output "database_endpoint" {
  description = "Connection endpoint for the database"
  value       = aws_db_instance.main.endpoint
}

output "database_name" {
  description = "Name of the database"
  value       = aws_db_instance.main.db_name
}

# S3 Bucket Information
output "logs_bucket_name" {
  description = "Name of the S3 logs bucket"
  value       = aws_s3_bucket.logs.id
}

# CloudWatch Log Groups
output "web_log_group" {
  description = "CloudWatch log group for web server"
  value       = aws_cloudwatch_log_group.web_server.name
}

output "app_log_group" {
  description = "CloudWatch log group for app server"
  value       = aws_cloudwatch_log_group.app_server.name
}

# Security Information
output "web_security_group_id" {
  description = "ID of the web security group"
  value       = aws_security_group.web.id
}

# Quick Access Instructions
output "quick_start_instructions" {
  description = "Instructions to verify deployment"
  value       = <<-EOT
  
  ================================
  DEPLOYMENT SUCCESSFUL! 🎉
  ================================
  
  Your infrastructure is now running. Here's what to do next:
  
  1. TEST WEB SERVER:
     Open your browser and visit: http://${aws_instance.web.public_ip}
     You should see your custom welcome page!
  
  2. VIEW LOGS IN CLOUDWATCH:
     - Go to AWS Console → CloudWatch → Log groups
     - Look for: /aws/ec2/web-server
  
  3. CHECK DATABASE:
     - Endpoint: ${aws_db_instance.main.endpoint}
     - Database: ${aws_db_instance.main.db_name}
     - Username: ${var.db_username}
  
  4. SSH TO WEB SERVER (if needed):
     First, create a key pair in AWS Console, then:
     ssh -i your-key.pem ubuntu@${aws_instance.web.public_ip}
  
  ================================
  IMPORTANT: Save these details!
  ================================
  
  EOT
}
