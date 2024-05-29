#!/usr/bin/env bash

# Remove all contents of the deployment directory
sudo rm -rf /home/ubuntu/sahir_blogs/*

# Remove existing .gitignore if it exists
if [ -f /home/ubuntu/sahir_blogs/.gitignore ]; then
    sudo rm /home/ubuntu/sahir_blogs/.gitignore
fi
