#!/bin/bash 
BUILD_DIR=build.RPi
if [[ ! -d ${BUILD_DIR} ]]; then 
mkdir ${BUILD_DIR} 
fi

cd ${BUILD_DIR}
pwd

rm -rf *

WORKSPACE=/home/anyconnect/projects
LIB_ROOT=${WORKSPACE}/ac-access/.build_RPi
CPPREST_ROOT=${LIB_ROOT}/accessapi-artifacts-RPi-ms/cpprest
BOOST_ROOT=${LIB_ROOT}/boost-1.61-RPi
OPENSSL_ROOT=${LIB_ROOT}/openssl-1.0.2l-RPi

command="cmake .. -DCMAKE_TOOLCHAIN_FILE=${WORKSPACE}/.launchers/automation/build/RPi/RPi.toolchain  \
-DCMAKE_BUILD_TYPE=Debug  \
-DBUILD_SHARED_LIBS=0 \
-DBoost_NO_BOOST_CMAKE=TRUE  \
-DBoost_NO_SYSTEM_PATHS=TRUE  \
-DBOOST_ROOT=${BOOST_ROOT}  \
-DBOOST_INCLUDEDIR=${BOOST_ROOT}/include  \
-DBoost_INCLUDE_DIR=${BOOST_ROOT}/include  \
-DBOOST_LIBRARYDIR=${BOOST_ROOT}/stage/lib  \
-DBoost_SYSTEM_LIBRARY=${BOOST_ROOT}/stage/lib  \
-DBoost_SYSTEM_LIBRARY=${BOOST_ROOT}/stage/lib/libboost_system-gcc-mt-1_61.a  \
-DBoost_THREAD_LIBRARY=${BOOST_ROOT}/stage/lib/libboost_thread-gcc-mt-1_61.a  \
-DBOOST_THREAD_LIBRARY=${BOOST_ROOT}/stage/lib/libboost_thread-gcc-mt-1_61.a  \
-DBoost_ATOMIC_LIBRARY=${BOOST_ROOT}/stage/lib/libboost_atomic-gcc-mt-1_61.a  \
-DBoost_CHRONO_LIBRARY=${BOOST_ROOT}/stage/lib/libboost_chrono-gcc-mt-1_61.a  \
-DBoost_DATE_TIME_LIBRARY=${BOOST_ROOT}/stage/lib/libboost_date_time-gcc-mt-1_61.a  \

-DOPENSSL_ROOT_DIR=${OPENSSL_ROOT}  \
-DOPENSSL_INCLUDE_DIR=${OPENSSL_ROOT}/include  \
-DOPENSSL_CRYPTO_LIBRARY=${OPENSSL_ROOT}/lib/libcrypto.a  \
-DOPENSSL_SSL_LIBRARY=${OPENSSL_ROOT}/lib/libssl.a \

-DCPPREST_STATIC_LIBRARY_DIR=${CPPREST_ROOT}/lib \
-DCPPREST_LIBRARY_DIR=${CPPREST_ROOT}/lib \
-DCPPREST_INCLUDE_DIR=${CPPREST_ROOT}/include \
-L"

echo $command
$command

make
