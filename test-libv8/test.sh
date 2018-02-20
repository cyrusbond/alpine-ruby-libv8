#!/bin/sh

set -e
set -x

if [ $# -ne 1 ]; then
    echo "Usage: $0 version"
    echo "Will build a binary libv8 gem."
    exit 1
fi;

VERSION=$1

pushd $(dirname $0)

cp ../out/libv8-${VERSION}-x86_64-linux.gem .

docker build .

popd
