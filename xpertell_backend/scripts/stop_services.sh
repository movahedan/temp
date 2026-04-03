#!/bin/bash
echo "Stopping Docker Compose services..."
cd /home/ubuntu/xpertell_backend
docker compose down

echo "Login into ECR docker registry..."
aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 545006460792.dkr.ecr.eu-central-1.amazonaws.com
