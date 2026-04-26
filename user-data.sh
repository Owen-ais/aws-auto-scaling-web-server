#!/bin/bash
dnf install -y httpd
systemctl start httpd
systemctl enable httpd

TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600" -s)
INSTANCE_ID=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/instance-id)
AZ=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/placement/availability-zone)

cat <<EOF > /var/www/html/index.html
<h1>Auto Scaling EC2 Web Server</h1>
<p>Instance ID: $INSTANCE_ID</p>
<p>Availability Zone: $AZ</p>
EOF
