#!/usr/bin/bash
sudo cp /home/ubuntu/sahir_blogs/gunicorn/gunicorn.socket  /etc/systemd/system/gunicorn.socket
sudo cp /home/ubuntu/sahir_blogs/gunicorn/gunicorn.service  /etc/systemd/system/gunicorn.service

# Reload systemd manager configuration
echo "Reloading systemd manager configuration..."
sudo systemctl daemon-reload

sudo systemctl start gunicorn.service
sudo systemctl enable gunicorn.service
