#!/bin/bash
# Web Server Initialization Script
# This script runs automatically when the EC2 instance starts

# Update system packages
apt-get update -y

# Install NGINX web server
apt-get install -y nginx

# Install CloudWatch agent
wget https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
dpkg -i amazon-cloudwatch-agent.deb

# Create a custom welcome page
cat > /var/www/html/index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AWS Secure Infrastructure</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            text-align: center;
            max-width: 600px;
        }
        h1 {
            color: #667eea;
            margin-bottom: 20px;
        }
        .status {
            background: #48bb78;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            display: inline-block;
            margin-top: 20px;
        }
        .info {
            margin-top: 30px;
            text-align: left;
            background: #f7fafc;
            padding: 20px;
            border-radius: 5px;
        }
        .info-item {
            margin: 10px 0;
        }
        .label {
            font-weight: bold;
            color: #667eea;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🚀 AWS Secure Infrastructure</h1>
        <p>Deployed with Terraform | Managed Infrastructure as Code</p>
        <div class="status">✓ System Online</div>
        
        <div class="info">
            <div class="info-item">
                <span class="label">Project:</span> Cloud Governance Portfolio
            </div>
            <div class="info-item">
                <span class="label">Architecture:</span> Multi-Tier Secure Design
            </div>
            <div class="info-item">
                <span class="label">Security:</span> Layered Security Groups
            </div>
            <div class="info-item">
                <span class="label">High Availability:</span> Multi-AZ Deployment
            </div>
            <div class="info-item">
                <span class="label">Automation:</span> Terraform IaC
            </div>
        </div>
        
        <p style="margin-top: 30px; color: #666;">
            Built by <strong>Gideon Ofumaduadike</strong>
        </p>
    </div>
</body>
</html>
EOF

# Start NGINX
systemctl start nginx
systemctl enable nginx

# Configure CloudWatch logging
cat > /opt/aws/amazon-cloudwatch-agent/etc/cloudwatch-config.json << 'EOF'
{
  "logs": {
    "logs_collected": {
      "files": {
        "collect_list": [
          {
            "file_path": "/var/log/nginx/access.log",
            "log_group_name": "/aws/ec2/web-server",
            "log_stream_name": "{instance_id}/nginx-access"
          },
          {
            "file_path": "/var/log/nginx/error.log",
            "log_group_name": "/aws/ec2/web-server",
            "log_stream_name": "{instance_id}/nginx-error"
          }
        ]
      }
    }
  }
}
EOF

# Start CloudWatch agent
/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
    -a fetch-config \
    -m ec2 \
    -s \
    -c file:/opt/aws/amazon-cloudwatch-agent/etc/cloudwatch-config.json

echo "Web server initialization complete!"
