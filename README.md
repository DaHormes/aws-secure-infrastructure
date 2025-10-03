# AWS Secure Infrastructure Foundation

## 🎯 Project Overview

Production-ready AWS infrastructure demonstrating cloud governance, security best practices, and Infrastructure as Code principles for scalable application deployment.

**Built by me:** Gideon Ofumaduadike  
**Date:** [Current Date]  
**Purpose:** Portfolio project demonstrating AWS and Terraform proficiency for Cloud Operations Leadership roles

---

## 🏗️ Architecture

![Architecture Diagram](architecture-diagram.png)

### Components

**Network Layer:**
- Custom VPC (10.0.0.0/16) with DNS enabled
- 2 Public subnets across 2 Availability Zones (High Availability)
- 2 Private subnets across 2 Availability Zones
- Internet Gateway for public internet access
- NAT Gateway for private subnet internet access (updates, patches)

**Compute Layer:**
- Web Server (EC2 t3.micro) - Public subnet, running NGINX
- Application Server (EC2 t3.micro) - Private subnet, Node.js ready

**Data Layer:**
- RDS PostgreSQL (db.t3.micro) - Multi-AZ capable
- S3 bucket for logs and assets (encrypted, versioned)

**Security Layer:**
- 3-tier security group architecture (Web, App, Database)
- IAM roles with least-privilege policies
- All storage encrypted at rest
- No hardcoded credentials

**Observability:**
- CloudWatch log groups for all tiers
- Enhanced RDS monitoring
- Centralized logging architecture

---

## 🔒 Security Implementation

### Network Security
- **Defense in Depth:** Multi-layer security groups
- **Zero Trust:** No implicit trust between tiers
- **Principle of Least Privilege:** Minimum required access only

### Security Group Rules

**Web Tier (Public):**
- ✅ HTTP (80) from 0.0.0.0/0
- ✅ HTTPS (443) from 0.0.0.0/0  
- ✅ SSH (22) from my IP only

**App Tier (Private):**
- ✅ Port 3000 from Web Security Group only
- ✅ SSH (22) from Web Security Group only

**Database Tier (Private):**
- ✅ PostgreSQL (5432) from App Security Group only

### Identity & Access Management
- Custom IAM role for EC2 instances
- Granular policies for CloudWatch logging
- Read-only S3 access where needed
- No overly permissive wildcard policies

### Data Protection
- S3 bucket encryption (AES-256)
- S3 versioning enabled
- RDS encryption at rest
- EBS volume encryption
- No public S3 access (blocked at bucket level)

---

## 🚀 Key Features

✅ **Multi-AZ High Availability Design**  
✅ **Fully Automated Deployment via Terraform**  
✅ **Centralized CloudWatch Logging**  
✅ **Zero-Trust Network Architecture**  
✅ **Infrastructure as Code (GitOps ready)**  
✅ **Cost-Optimized (Free Tier resources)**  
✅ **Production-Ready Security Patterns**

---

## 📊 Skills Demonstrated

### Cloud Engineering
- AWS VPC design and implementation
- Multi-tier application architecture
- High availability planning
- Network segmentation

### Security & Governance
- IAM policy creation and management
- Security group design
- Encryption implementation
- Compliance-ready architecture (CIS-18 aligned)

### DevOps & Automation
- Infrastructure as Code (Terraform)
- Configuration management (user_data scripts)
- Version control (Git)
- Automated provisioning

### Observability
- CloudWatch integration
- Centralized logging
- Monitoring setup
- Log retention policies

---

## 🎓 Business Impact

This architecture directly addresses enterprise cloud needs:

**Unified Security:** Centralized IAM and security group policies eliminate configuration drift and ensure consistent protection across all resources.

**Speed & Scale:** Fully automated, repeatable deployments enable rapid environment provisioning. New regions or environments can be deployed in minutes, not days.

**Resilience:** Multi-AZ design ensures high availability. Managed services (RDS, S3) provide built-in redundancy and automated backups.

**Cost Optimization:** Right-sized resources with proper tagging enable accurate cost allocation and optimization opportunities.

**Audit & Compliance:** Infrastructure defined as code provides complete audit trail. All changes version-controlled and traceable.

---

## 🛠️ Technologies Used

**Cloud Platform:** AWS  
**IaC Tool:** Terraform 1.5+  
**Operating System:** Ubuntu 22.04 LTS  
**Web Server:** NGINX  
**Database:** PostgreSQL 15.7  
**Monitoring:** CloudWatch  
**Version Control:** Git

---

## 📁 Project Structure
aws-secure-infrastructure/
├── main.tf                      # Main infrastructure code
├── variables.tf                 # Input variables
├── outputs.tf                   # Output values
├── terraform.tfvars.example     # Example variables file
├── scripts/
│   └── web-server-init.sh      # Web server bootstrap script
└── README.md                    



---

## 🚀 Deployment Instructions

### Prerequisites
- AWS account with appropriate permissions
- Terraform 1.0+ installed
- AWS CLI configured
- Git installed

### Steps

1. **Clone my repository:**
```bash
   git clone [your-repo-url]
   cd aws-secure-infrastructure

   #Configure variables
   cp terraform.tfvars.example terraform.tfvars
   # Edit terraform.tfvars with your own values

   #Initialize Terraform
   terraform init

   #Review plan
   terraform plan

   #Deploy
   terraform apply

   #Access web server
   #Get the URL from output of cmd:
   terraform output web_server_url
   #Open in a browser

   #Destroy
   terraform destroy
   #Only do this when you are done with project.
   #If it is just a portfolio project like mine, then destroy after documentation to avoid incuring cost.