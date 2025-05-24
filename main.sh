sudo su -
cd /etc/yum.repos.d/

CONTENT="[jenkins]
name=Jenkins-stable
baseurl=http://pkg.jenkins.io/redhat-stable
gpgcheck=1
"

vim "jenkins.repo" <<EOF
:1
i
$CONTENT
.
:wq
EOF

rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
yum install fontconfig java-21-openjdk -y
yum install jenkins -y
systemctl daemon-reload
systemctl enable jenkins
systemctl start jenkins

