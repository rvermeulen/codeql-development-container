#!/bin/bash

set -e

export PATH=/bin:/usr/bin

echo Downloading CodeQL $1...
curl -s -L https://github.com/github/codeql-cli-binaries/releases/download/$1/codeql.zip -o /tmp/codeql.zip
echo Cloning CodeQL repositories...
mkdir $HOME/codeql-home
git clone https://github.com/github/codeql.git $HOME/codeql-home/codeql-repo
git clone https://github.com/github/codeql-go.git $HOME/codeql-home/codeql-repo/codeql-go-repo
if [ "$2" != "head" ]; then
    echo "Switching to CodeQL repository reference $2"
    pushd $HOME/codeql-home/codeql-repo
    git checkout "$2"
    popd
    pushd $HOME/codeql-home/codeql-repo/codeql-go-repo
    git checkout "$2"
    popd
fi
echo Unzipping CodeQL $1...
unzip /tmp/codeql.zip -d $HOME/codeql-home/
mv $HOME/codeql-home/codeql $HOME/codeql-home/codeql-cli
echo Cleaning up...
rm -f /tmp/codeql.zip