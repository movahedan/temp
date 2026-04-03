#!/bin/bash
echo "Start installing composer"
composer install
echo "### Composer installed"
echo "Start Copying .env"
#cp .env.develop .env
echo "### .env copied"
echo "Generate laravel Key"
php artisan key:generate
echo "### laravel Key Generated"
