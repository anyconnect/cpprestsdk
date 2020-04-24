#!/bin/bash
AC_PLATFORM=$1

case $AC_PLATFORM in
    iOS|ubuntu|RPi|android) echo "Platfrom found: $AC_PLATFORM";;
    *)             echo "Invlaid Platform name. Try iOS/ubuntu/RPi/android" ;;
esac

export AC_PLATFORM
source build.$AC_PLATFORM.sh