#!/bin/bash

set -e

export PATH=/bin:/usr/bin:/usr/local/go/bin

echo "Downloading depstubber"
git clone https://github.com/github/depstubber.git
cd depstubber
echo "Building depstubber"
go build
echo "Installing depstubber"
go install github.com/github/depstubber
echo "Cleaning"
cd ..
rm -Rf depstubber