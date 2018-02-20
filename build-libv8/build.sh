#!/bin/sh

if [ $# -ne 1 ]; then
    echo "Usage: $0 version"
    echo "Will build a binary libv8 gem."
    exit 1
fi;

set -e
set -x

VERSION=$1

pushd $(dirname $0)

docker build . -t generate_libv8

docker run --rm generate_libv8 cat /gem/libv8-${VERSION}-x86_64-linux.gem > ../out/libv8-${VERSION}-x86_64-linux.gem

popd
