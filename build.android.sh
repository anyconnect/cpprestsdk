#!/bin/bash

CPPREST_BUILD_DIR=build.$AC_PLATFORM
echo "Build dir: $CPPREST_BUILD_DIR"
if [[ -d ${CPPREST_BUILD_DIR} ]]; then rm -rf ${CPPREST_BUILD_DIR} ; fi
mkdir ${CPPREST_BUILD_DIR}
cd ${CPPREST_BUILD_DIR}


ANDROID_NDK=$HOME/android-sdk/android-ndk-r18b
BOOSTVER=1.65
ROOT=$CPPREST_ROOT/.build_${AC_PLATFORM}
BOOST_ROOT=${ROOT}/boost-1.65-${AC_PLATFORM}/armeabi-v7a
OPENSSL_ROOT=${ROOT}/openssl-1.0.2l-${AC_PLATFORM}



build_cpprestsdk() {
    rm -rf $1
    BOOST_ROOT=${ROOT}/boost-1.65-${AC_PLATFORM}/$1
    COMMAND="/snap/bin/cmake .. \
    -DCMAKE_TOOLCHAIN_FILE="${ANDROID_NDK}/build/cmake/android.toolchain.cmake" \
    -DANDROID_NDK="${ANDROID_NDK}" \
    -DANDROID_TOOLCHAIN=clang \
    -DANDROID_ABI=$1 \
    -DBOOST_VERSION="${BOOSTVER}" \
    -DANDROID_PLATFORM=android-$3 \
    -DANDROID_NATIVE_API_LEVEL=$3 \
    
    -DBUILD_TESTS=false -DBUILD_SAMPLES=false \
    -DCPPREST_EXCLUDE_BROTLI=true -DCPPREST_EXCLUDE_COMPRESSION=true \
    
    -DBOOST_ROOT=${BOOST_ROOT}  \
    -DBOOST_INCLUDEDIR=${BOOST_ROOT}/include  \
    -DBoost_INCLUDE_DIR=${BOOST_ROOT}/include  \
    -DBOOST_LIBRARYDIR=${BOOST_ROOT}/lib  \
    -DBoost_SYSTEM_LIBRARY=${BOOST_ROOT}/lib  \
    -DBoost_SYSTEM_LIBRARY=${BOOST_ROOT}/lib/libboost_system-clang-mt-1_65_1.a  \
    -DBoost_THREAD_LIBRARY=${BOOST_ROOT}/lib/libboost_thread-clang-mt-1_65_1.a  \
    -DBoost_ATOMIC_LIBRARY=${BOOST_ROOT}/lib/libboost_atomic-clang-mt-1_65_1.a  \
    -DBoost_CHRONO_LIBRARY=${BOOST_ROOT}/lib/libboost_chrono-clang-mt-1_65_1.a  \
    -DBoost_DATE_TIME_LIBRARY=${BOOST_ROOT}/lib/libboost_date_time-clang-mt-1_65_1.a  \
    -DBoost_RANDOM_LIBRARY=${BOOST_ROOT}/lib/libboost_random-clang-mt-1_65_1.a  \
    -DBoost_FILESYSTEM_LIBRARY=${BOOST_ROOT}/lib/libboost_filesystem-clang-mt-1_65_1.a  \
    
    -DOPENSSL_ROOT_DIR=${OPENSSL_ROOT}  \
    -DOPENSSL_INCLUDE_DIR=${OPENSSL_ROOT}/include  \
    -DOPENSSL_CRYPTO_LIBRARY=${OPENSSL_ROOT}/lib/libcrypto.a  \
    -DOPENSSL_SSL_LIBRARY=${OPENSSL_ROOT}/lib/libssl.a \
    -DCMAKE_BUILD_TYPE=$2 \
    -B $1"
    echo $COMMAND
    $COMMAND
    MAKE_COMMAND="make -j 7 -C $1"
    $MAKE_COMMAND
}

build_cpprestsdk armeabi-v7a Release 18
build_cpprestsdk arm64-v8a Release 23
