#!/bin/bash

echo "-----------------------------------------------------------------------------"
curl -s https://raw.githubusercontent.com/BidyutRoy2/BidyutRoy2/main/logo.sh | bash
echo "-----------------------------------------------------------------------------"

# Install curl if not already installed
if ! command -v curl &> /dev/null
then
    echo "curl not found. Installing curl..."
    sudo apt-get install -y curl
else
    echo "curl is already installed."
fi

# Check if Homebrew is installed
if ! command -v brew &> /dev/null
then
    echo "Homebrew not found. Skipping Homebrew setup..."
else
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"'
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Update the system packages
sudo apt update

# Install Docker if not installed
if ! command -v docker &> /dev/null
then
    echo "Docker not found. Installing Docker..."
    sudo apt install -y docker.io
else
    echo "Docker is already installed."
fi

# Check the current Docker Compose version
current_version=$(docker-compose --version 2>/dev/null)

# Define the latest Docker Compose version
latest_version="1.29.2"

# If Docker Compose is not installed or needs upgrading
if [[ -z "$current_version" || "$current_version" != *"$latest_version"* ]]; then
    echo "Upgrading Docker Compose to version $latest_version..."

    # Download the latest version of Docker Compose
    sudo curl -L "https://github.com/docker/compose/releases/download/$latest_version/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

    # Set executable permissions
    sudo chmod +x /usr/local/bin/docker-compose
else
    echo "Docker Compose is already up to date ($current_version)."
fi
