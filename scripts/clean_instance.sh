#!/usr/bin/env bash

# Ensure the script is executable
chmod +x /home/ubuntu/sahir_blogs/scripts/clean_instance.sh

# Remove all contents of the deployment directory
sudo rm -rf /home/ubuntu/sahir_blogs/*

# Remove existing .gitignore if it exists
if [ -f /home/ubuntu/sahir_blogs/.gitignore ]; then
    rm /home/ubuntu/sahir_blogs/.gitignore
fi
