#!/bin/bash

set -e

echo "Starting post installation setup..."

echo "Configuring user PATH"
echo PATH=$PATH:/usr/local/go/bin:$HOME/codeql-home/codeql-cli:$HOME/go/bin >> $HOME/.bashrc