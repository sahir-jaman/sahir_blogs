#!/usr/bin/env bash
#
sudo rm -rf /home/ubuntu/sahir_blogs/*


# Remove existing .gitignore if it exists
if [ -f /home/ubuntu/sahir_blogs/.gitignore ]; then
    rm /home/ubuntu/sahir_blogs/.gitignore
fi