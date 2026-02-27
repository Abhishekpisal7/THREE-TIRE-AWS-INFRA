#!/bin/bash
set -e

# Example userdata script for web tier
echo "Running web userdata"
apt-get update -y
apt-get install -y nginx
systemctl enable nginx
systemctl start nginx
