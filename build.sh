#!/bin/bash

# Usage example 
# bash build.sh <Platforms (iOS|ubuntu|RPi|android)> <cpprest absolute path>
# bash build.sh RPi /home/cpprest_root

if [ "$#" -ne 2 ]; then
    echo "You must enter exactly 2 command line arguments"
fi
echo $#


AC_PLATFORM=$1
CPPREST_ROOT=$2

case $AC_PLATFORM in
    iOS|ubuntu|RPi|android) echo "Platfrom found: $AC_PLATFORM";;
    *)             echo "Invlaid Platform name. Try iOS/ubuntu/RPi/android" ;;
esac

export AC_PLATFORM=$AC_PLATFORM

export CPPREST_ROOT=$CPPREST_ROOT
# cpprest_root directory should contian include files and  
# all the libraries (boost, openssl etc) for all platform
# are present With a dir structure as below

# cpprest_root/.build_RPi
# ├── boost-1.61-RPi
# │   ├── include
# │   └── stage
# ├── openssl-1.0.2l-RPi
# │   ├── include
# │   └── lib
# cpprest_root/.build_ubuntu/
# ├── boost-1.61-ubuntu
# │   ├── include
# │   └── stage
# cpprest_root/.build_android/
# ├── boost-1.65-android
# │   ├── arm64-v8a
# │   │   ├── include
# │   │   └── lib
# │   ├── armeabi-v7a
# │   │   ├── include
# │   │   └── lib
# └── openssl-1.0.2l-android
#     ├── include
#     │   └── openssl
#     └── lib
#         ├── arm64-v8a
#         ├── armeabi-v7a


source build.$AC_PLATFORM.sh