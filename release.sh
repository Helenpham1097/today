#!/bin/bash
set -ex

# Run database migrations
php artisan migrate --force

# Clear old caches
php artisan cache:clear

# Warm up the application cache
php artisan cache:warm#!/bin/bash
