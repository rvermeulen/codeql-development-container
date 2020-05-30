#!/bin/bash

set -e

# Create the following directory structure to prevent symbolic link errors when installing openjdk
mkdir -p /usr/share/man/man1
DEBIAN_FRONTEND=noninteractive /usr/bin/apt-get -yq install openjdk-11-jdk-headless maven build-essential golang