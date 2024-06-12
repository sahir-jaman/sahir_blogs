#!/usr/bin/bash

# Add logging
exec > >(tee -i /var/log/start_app.log)
exec 2>&1

echo "Starting application setup"

# Ensure correct Python version
PYTHON_BIN=/home/ubuntu/env/bin/python3

# Update ALLOWED_HOSTS
sed -i 's/\[]/\["54.144.250.113"]/' /home/ubuntu/sahir_blogs/src/settings.py

# Navigate to project directory
cd /home/ubuntu/sahir_blogs || exit

# Make migrations (usually not necessary if you migrate, but for completeness)
$PYTHON_BIN manage.py makemigrations
if [ $? -ne 0 ]; then
    echo "Making migrations failed"
    exit 1
fi

# Migrate database
$PYTHON_BIN manage.py migrate
if [ $? -ne 0 ]; then
    echo "Database migration failed"
    exit 1
fi


# Collect static files
$PYTHON_BIN manage.py collectstatic --noinput
if [ $? -ne 0 ]; then
    echo "Collecting static files failed"
    exit 1
fi

# Restart services
sudo service gunicorn restart
if [ $? -ne 0 ]; then
    echo "Restarting Gunicorn failed"
    exit 1
fi

sudo service nginx restart
if [ $? -ne 0 ]; then
    echo "Restarting Nginx failed"
    exit 1
fi

echo "Application setup completed"
