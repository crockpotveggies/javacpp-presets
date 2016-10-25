#!/bin/bash
# This file is meant to be included by the parent cppbuild.sh script
if [[ -z "$PLATFORM" ]]; then
    pushd ..
    bash cppbuild.sh "$@" dlib
    popd
    exit
fi

DLIB_VERSION=19.1
download http://dlib.net/files/dlib-19.1.tar.bz2 dlib-$DLIB_VERSION.tar.gz
mkdir -p $PLATFORM
cd $PLATFORM
tar -xzvf ../dlib-$DLIB_VERSION.tar.gz
cd dlib-$DLIB_VERSION

case $PLATFORM in
    macosx-x86_64)
        brew install dlib
        ;;
    linux)
        cmake -DCMAKE_C_FLAGS_RELEASE=-DNDEBUG -DCMAKE_CXX_FLAGS_RELEASE=-DNDEBUG -DDLIB_USE_BLAS=ON -DDLIB_USE_LAPACK=ON -Dcblas_lib=/usr/lib/libcblas.dylib -Dlapack_lib=/usr/lib/liblapack.dylib
        make
        make install
        ;;
    *)
        echo "Error: Platform \"$PLATFORM\" is not supported"
        ;;
esac