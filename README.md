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
   ```


2. **Configure variables**
```bash
   cp terraform.tfvars.example terraform.tfvars
   # Edit terraform.tfvars with your own values
   ```

3. **Initialize Terraform**
```bash
   terraform init
   ```
4. **Review plan**
```bash
   terraform plan
```


5. **Deploy**
```bash
   terraform apply
```


6. **Access web server**
   - Get the URL from output of cmd:
```bash 
   terraform output web_server_url
```
   - Open in a browser

7. **Destroy (when finished**
```bash 
   terraform destroy
```
   - Only do this when you are done with project.
   - If it is just a portfolio project like mine, then destroy after documentation to avoid incuring cost.

---



## 💡 Key Learnings 
### Technical Insights

- **Platform-Agnostic Cloud Principles:** Coming from Azure/M365, I discovered that core networking, security, and governance concepts translate seamlessly across cloud providers. VPCs are similar to VNets, security groups mirror NSGs, and IAM follows the same least-privilege principles as Azure RBAC.
- **Infrastructure as Code Power:** Terraform's declarative approach eliminated configuration drift entirely. Every resource is version-controlled, peer-reviewable, and reproducible—critical for enterprise operations.
- **Security by Design:** Implementing defense-in-depth from the start was easier than retrofitting security. Each tier has its own security group, and default-deny policies prevented accidental exposure.
- **Managed Services Value:** Using RDS instead of self-hosted PostgreSQL eliminated hours of database administration while providing better reliability, automated backups, and enhanced monitoring.

### Operational Insights

- **Multi-AZ is Essential:** Even in a demo project, spanning availability zones proved the resilience thinking required for production workloads.
- **Tagging Strategy Matters:** Consistent tagging (Project, Environment, ManagedBy) enabled instant resource identification and cost allocation visibility.
- **Documentation is Infrastructure:** The README and architecture diagram are as important as the code itself—they enable team collaboration and knowledge transfer.

---

## 🔄 Future Enhancements
### Phase 2 (Production Readiness):

 Implement Application Load Balancer for web tier
 Add Auto Scaling Groups for compute elasticity
 Enable RDS Multi-AZ deployment
 Implement AWS Secrets Manager for database credentials
 Add AWS WAF for web application firewall
 Configure CloudWatch alarms and SNS notifications

### Phase 3 (Advanced Features):

 Implement VPC Flow Logs for network traffic analysis
 Add AWS Systems Manager for patch management
 Configure AWS Config for compliance monitoring
 Implement AWS Backup for centralized backup management
 Add Route 53 for DNS management with health checks

---

## 📈 Project Metrics
**Infrastructure Components:** 30+ AWS resources
**Deployment Time:** ~12 minutes (fully automated)
**Code Lines:** ~800 lines of Terraform
**Security Layers:** 3-tier architecture
**High Availability Zones:** 2
**Estimated Monthly Cost:** $15-20 (with free tier: $0-5)
---

## 📞 Contact & Links
**Author:** Gideon Ofumaduadike
**LinkedIn:** linkedin.com/in/gideon-ofu
**Email:** ofugideon@gmail.com

**I am very much open to collaborations and contracts. Let's connect and discuss how help scale your cloud infrastructure.**

---

### 📝 License
This project is open source and available for educational purposes.

###🙏 Acknowledgments
I built this as a portfolio project to demonstrate cloud governance and automation capabilities for enterprise cloud operations roles, specifically for a Cloud & Systems Operations role was I interested in.
This project showcases the ability to rapidly adapt platform-specific knowledge (Azure → AWS) while maintaining strong cloud engineering fundamentals.

**Note:** This infrastructure is designed for demonstration purposes. For production use, additional hardening, monitoring, and compliance configurations would be implemented based on specific organizational requirements.

Thank You!.


**I am very much open to collaborations and contracts. Let's connect and discuss how help scale your cloud infrastructure.**