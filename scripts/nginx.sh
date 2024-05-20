
#!/usr/bin/bash

sudo systemctl daemon-reload
sudo rm -f /etc/nginx/sites-enabled/default

echo "Removing the default Nginx site if it exists..."
sudo rm -f /etc/nginx/sites-enabled/default

sudo rm -f /etc/nginx/sites-available/default

sudo cp /home/ubuntu/sahir_blogs/nginx/nginx.conf /etc/nginx/sites-available/blog
sudo ln -s /etc/nginx/sites-available/blog /etc/nginx/sites-enabled/
#sudo ln -s /etc/nginx/sites-available/blog /etc/nginx/sites-enabled
#sudo nginx -t
sudo gpasswd -a www-data ubuntu
sudo systemctl restart nginx

