#!/bin/bash 

CPPREST_BUILD_DIR=build.$AC_PLATFORM
if [[ -d ${CPPREST_BUILD_DIR} ]]; then  rm -rf CPPREST_BUILD_DIR ; fi
mkdir ${CPPREST_BUILD_DIR}
cd ${CPPREST_BUILD_DIR}
pwd

BOOST_ROOT=$CPPREST_ROOT/.build_ubuntu/boost-1.61-ubuntu

command="cmake .. -DBUILD_TESTING=false -DBUILD_SAMPLES=true \
  -DCMAKE_BUILD_TYPE=Debug -DBUILD_TESTS=false -DBUILD_SAMPLES=true \
  -DCPPREST_EXCLUDE_BROTLI=true -DCPPREST_EXCLUDE_COMPRESSION=true \
  -DBUILD_SHARED_LIBS=0  \
  -DBoost_NO_BOOST_CMAKE=TRUE \
  -DBoost_NO_SYSTEM_PATHS=TRUE \
  -DBOOST_ROOT=${BOOST_ROOT} \
  -DBOOST_INCLUDEDIR=${BOOST_ROOT}/include \
  -DBoost_INCLUDE_DIR=${BOOST_ROOT}/include \
  -DBoost_SYSTEM_LIBRARY=${BOOST_ROOT}/stage/lib/libboost_system-gcc-mt-1_61.a \
  -DBOOST_LIBRARYDIR=${BOOST_ROOT}/stage/lib \
  -L
"
echo $command
$command

make cpprest -j7