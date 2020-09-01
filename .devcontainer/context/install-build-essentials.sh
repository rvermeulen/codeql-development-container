#!/bin/bash

set -e

export PATH=/bin:/sbin:/usr/bin:/usr/sbin/

# Add PPA for nodejs 12
curl -sL https://deb.nodesource.com/setup_12.x | bash -

# Create the following directory structure to prevent symbolic link errors when installing openjdk
mkdir -p /usr/share/man/man1
DEBIAN_FRONTEND=noninteractive apt-get -yq install \
    openjdk-11-jdk-headless maven \
    build-essential \
    python python-pip python3 python3-pip python3-venv \
    nodejs

curl https://dl.google.com/go/go$1.linux-amd64.tar.gz --output go$1.linux-amd64.tar.gz
tar -C /usr/local -xzf go$1.linux-amd64.tar.gz
rm go$1.linux-amd64.tar.gz

