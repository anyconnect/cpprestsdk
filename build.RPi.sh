#!/bin/bash 

CPPREST_BUILD_DIR=build.$AC_PLATFORM
if [[ -d ${CPPREST_BUILD_DIR} ]]; then  rm -rf CPPREST_BUILD_DIR ; fi
mkdir ${CPPREST_BUILD_DIR}
cd ${CPPREST_BUILD_DIR}
pwd



ROOT=$HOME/projects/ac-access/.build_RPi
BOOST_ROOT=${ROOT}/boost-1.61-RPi
OPENSSL_ROOT=${ROOT}/openssl-1.0.2l-RPi

command="cmake .. -DCMAKE_TOOLCHAIN_FILE=$HOME/projects/.launchers/automation/build/RPi/RPi.toolchain  \
-DBUILD_TESTS=false -DBUILD_SAMPLES=true \
-DCPPREST_EXCLUDE_BROTLI=true -DCPPREST_EXCLUDE_COMPRESSION=true \
-DCMAKE_BUILD_TYPE=Debug  \
-DACPLATFORM:STRING=RPi  \
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

-DBoost_REGEX_LIBRARY=${BOOST_ROOT}/stage/lib/libboost_regex-gcc-mt-1_61.a  \

-DBoost_RANDOM_LIBRARY=${BOOST_ROOT}/stage/lib/libboost_random-gcc-mt-1_61.a  \

-DBoost_FILESYSTEM_LIBRARY=${BOOST_ROOT}/stage/lib/libboost_filesystem-gcc-mt-1_61.a  \

-DOPENSSL_ROOT_DIR=${OPENSSL_ROOT}  \
-DOPENSSL_INCLUDE_DIR=${OPENSSL_ROOT}/include  \
-DOPENSSL_CRYPTO_LIBRARY=${OPENSSL_ROOT}/lib/libcrypto.a  \
-DOPENSSL_SSL_LIBRARY=${OPENSSL_ROOT}/lib/libssl.a \
-L"

echo $command
$command
# cp Release/Binaries/libcpprest.a ${ROOT}/accessapi-artifacts-RPi-ms/cpprest/lib/
make cpprest -j7
