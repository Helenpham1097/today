#!/bin/bash
# Build for webslice.com
echo "Starting Build Script"

# Print command output for each command and exit immediately if any command fails (https://man7.org/linux/man-pages/man1/set.1p.html)
set -ex

#COMPOSER_PROCESS_TIMEOUT=2000 composer install --no-interaction -vvv --no-dev --prefer-dist --optimize-autoloader
#npm ci --cache .npm --prefer-offline
#npm run build:prod
#php artisan key:generate

echo "Build Script Finished Successfully"
