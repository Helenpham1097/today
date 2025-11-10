#!/bin/bash

# Exit on error
set -e

echo "Starting WordPress build..."

# Install dependencies
echo "Installing npm dependencies..."
npm install

# Lint code
echo "Linting code..."
npm run lint || true

# Build CSS
echo "Building CSS..."
npm run build:css

# Build JavaScript
echo "Building JavaScript..."
npm run build:js

# Install Composer dependencies (for plugins/themes)
if [ -f "composer.json" ]; then
    echo "Installing Composer dependencies..."
    composer install --no-dev --optimize-autoloader
fi

# Optimize images
if command -v optipng &> /dev/null; then
    echo "Optimizing PNG images..."
    find ./assets/images -name "*.png" -exec optipng -o2 {} \;
fi

# Clean up development files
echo "Cleaning up..."
rm -rf node_modules/.cache
rm -rf src/

echo "Build completed successfully!"

