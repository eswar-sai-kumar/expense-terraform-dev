#!/bin/bash

# Exit on any error
set -e

# Switch to root user (script must be run as sudo or root)
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root or using sudo."
  exit 1
fi

cd /etc/yum.repos.d/

vim -E -s jenkins.repo <<-EOF
  i
[jenkins]
name=Jenkins-stable
baseurl=http://pkg.jenkins.io/redhat-stable
gpgcheck=1
.
wq
EOF

rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

yum install -y fontconfig java-21-openjdk

yum install -y jenkins

systemctl daemon-reload
systemctl enable jenkins
systemctl start jenkins

echo "✅ Jenkins installation completed. Access it at: http://<your-server-ip>:8080"
