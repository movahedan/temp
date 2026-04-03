#!/bin/bash
echo "Starting Docker Compose services..."
cd /home/ubuntu/xpertell_backend
docker compose up -d --scale app=1

echo "Waiting for services to start..."
sleep 6

echo "Running migrations and caching routes..."
docker exec xpertell-app php artisan optimize:clear
docker exec xpertell-app php artisan migrate --force
docker exec xpertell-app php artisan route:cache
docker exec xpertell-app php artisan config:cache

docker image prune -a -f