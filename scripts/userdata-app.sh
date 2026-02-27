#!/bin/bash
set -e

# Example userdata script for app tier
echo "Running app userdata"
apt-get update -y
apt-get install -y python3
