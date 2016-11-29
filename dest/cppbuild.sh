#!/bin/bash
# This file is meant to be included by the parent cppbuild.sh script
if [[ -z "$PLATFORM" ]]; then
    pushd ..
    bash cppbuild.sh "$@" dest
    popd
    exit
fi

DEST_VERSION=0.8
download https://github.com/cheind/dest/archive/v$DEST_VERSION.tar.gz dest-$DEST_VERSION.tar.gz
mkdir -p $PLATFORM
cd $PLATFORM
tar -xzvf ../dest-$DEST_VERSION.tar.gz
cd dest-$DEST_VERSION


case $PLATFORM in
    macosx-x86_64)
        brew install eigen
        cmake -DDEST_EIGEN_DIR=/usr/local/Cellar/eigen/3.3.0/include/eigen3/ .
        make
        make DESTDIR=/usr/lib install
        ;;
    linux)
        cmake -DDEST_EIGEN_DIR=$DEST_EIGEN_DIR .
        make
        make DESTDIR=/usr/lib install
        ;;
    *)
        echo "Error: Platform \"$PLATFORM\" is not supported"
        ;;
esac
