#!/bin/bash
set -ex

# Install Composer dependencies (production only)
composer install --no-dev --optimize-autoloader

# Install Node dependencies and build assets
npm ci
npm run build

# Cache Laravel configuration/routes/templates
php artisan config:cache
php artisan route:cache
php artisan view:cache


