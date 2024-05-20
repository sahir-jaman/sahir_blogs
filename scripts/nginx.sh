#!/usr/bin/env bash

set -e  # Exit immediately if a command exits with a non-zero status
set -o pipefail  # Ensure the script fails on the first failed command in a pipeline

echo "Reloading systemd manager configuration..."
sudo systemctl daemon-reload

echo "Removing the default Nginx site if it exists..."
sudo rm -f /etc/nginx/sites-enabled/default

echo "Copying custom Nginx configuration..."
sudo cp /home/ubuntu/sahir_blogs/nginx/nginx.conf /etc/nginx/sites-available/blog

echo "Creating a symbolic link to enable the new Nginx configuration..."
if [ ! -L /etc/nginx/sites-enabled/blog ]; then
  sudo ln -s /etc/nginx/sites-available/blog /etc/nginx/sites-enabled/
fi

echo "Adding user 'ubuntu' to the 'www-data' group..."
if ! getent group www-data | grep -q "\bubuntu\b"; then
  sudo usermod -aG www-data ubuntu
fi

echo "Restarting Nginx service..."
sudo systemctl restart nginx

echo "Checking Nginx configuration for syntax errors..."
sudo nginx -t

echo "Reloading Nginx to apply the configuration..."
sudo systemctl reload nginx

echo "Nginx configuration and restart completed successfully."
