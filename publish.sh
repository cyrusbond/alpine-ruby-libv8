#!/bin/sh

if [ $# -ne 1 ]; then
    echo "Usage: $0 version"
    echo "Build and publish the binary libv8 gem."
    exit 1
fi;

if ! [ -x "$(command -v aws)" ]; then
    echo "Error: aws CLI not found"
    exit 1
fi;

set -e
set -x

VERSION=$1

./build-libv8/build.sh ${VERSION}
./test-libv8/test.sh ${VERSION}

aws s3 cp ./out/libv8-${VERSION}-x86_64-linux.gem s3://sqreen-download-public/ruby/alpine/

echo "The gem was pushed to the following locations:"
echo "https://download.sqreen.io/ruby/alpine/libv8-${VERSION}-x86_64-linux.gem"
