#!/bin/bash

# Exit on any error
set -e

# Switch to root user (script must be run as sudo or root)
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root or using sudo."
  exit 1
fi

# Step 1: Go to yum repo directory
cd /etc/yum.repos.d/

# Step 2: Download Jenkins repo file directly
curl -o jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

# Step 3: Import Jenkins GPG key
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# Step 4: Install Java (required for Jenkins)
yum install -y fontconfig java-21-openjdk

# Step 5: Install Jenkins
yum install -y jenkins

# Step 6: Reload systemd, enable and start Jenkins
systemctl daemon-reload
systemctl enable jenkins
systemctl start jenkins

echo "✅ Jenkins installation completed. Access it at: http://<your-server-ip>:8080"
