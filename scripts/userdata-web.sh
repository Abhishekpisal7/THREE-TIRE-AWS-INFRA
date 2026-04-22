#!/bin/bash
set -e

apt update -y
apt install apache2 -y


TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" \
        -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

INSTANCE_ID=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" \
         http://169.254.169.254/latest/meta-data/instance-id)

PUBLIC_IP=$(curl -H "X-aws-ec2-metadata-token: ${TOKEN}" \
         http://169.254.169.254/latest/meta-data/public-ipv4)

AZ=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" \
   http://169.254.169.254/latest/meta-data/placement/availability-zone)

cat <<EOF > /var/www/html/index.html
<h1><b>welcome the my application</b></h1>
<h2>Instance-id:${INSTANCE_ID}</h2>
<h2>Public-ip:${PUBLIC_IP}</h2>
<h2>Availability Zone:${AZ}</h2>
EOF

systemctl start apache2
systemctl enable apache2