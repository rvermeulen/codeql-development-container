#!/bin/bash

set -e

echo Downloading CodeQL $1...
/usr/bin/curl -s -L https://github.com/github/codeql-cli-binaries/releases/download/$1/codeql.zip -o /tmp/codeql.zip
echo Cloning CodeQL repositories...
mkdir $HOME/codeql-home
/usr/bin/git clone https://github.com/github/codeql.git $HOME/codeql-home/codeql-repo
/usr/bin/git clone https://github.com/github/codeql-go.git $HOME/codeql-home/codeql-repo/codeql-go-repo
echo Unzipping CodeQL $1...
/usr/bin/unzip /tmp/codeql.zip -d $HOME/codeql-home/
mv $HOME/codeql-home/codeql $HOME/codeql-home/codeql-cli
echo PATH=$PATH:$HOME/codeql-home/codeql-cli >> $HOME/.bashrc
echo Cleaning up...
rm -f /tmp/codeql.zip