# AWS Region
variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "us-east-1"
}

# Project Name
variable "project_name" {
  description = "Project name for resource tagging"
  type        = string
  default     = "secure-infrastructure"
}

# Environment
variable "environment" {
  description = "Environment name"
  type        = string
  default     = "production"
}

# VPC CIDR
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# Availability Zones
variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

# EC2 Instance Type
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

# Your IP for SSH Access (IMPORTANT: Change this!)
variable "my_ip" {
  description = "Your IP address for SSH access"
  type        = string
  default     = "0.0.0.0/0" # Change this to your actual IP for security
}

# Database Settings
variable "db_username" {
  description = "Database master username"
  type        = string
  default     = "dbadmin"
}

variable "db_password" {
  description = "Database master password"
  type        = string
  sensitive   = true
}

# Tags
variable "common_tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default = {
    Project   = "AWS-Secure-Infrastructure"
    ManagedBy = "Terraform"
    Owner     = "Gideon-Ofumaduadike"
  }
}
