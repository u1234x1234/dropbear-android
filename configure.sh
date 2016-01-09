#!/bin/sh

export DEV_PREFIX=$HOME/libs/android
export ANDROID_NDK=${DEV_PREFIX}/android-ndk-r10e/

export CROSS_COMPILE=arm-linux-androideabi
export ANDROID_PREFIX=${ANDROID_NDK}/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64

export SYSROOT=${ANDROID_NDK}/platforms/android-21/arch-arm
export CROSS_PATH=${ANDROID_PREFIX}/bin/${CROSS_COMPILE}


export CPP=${CROSS_PATH}-cpp
export AR=${CROSS_PATH}-ar
export AS=${CROSS_PATH}-as
export NM=${CROSS_PATH}-nm
export CC=${CROSS_PATH}-gcc
export CXX=${CROSS_PATH}-g++
export LD=${CROSS_PATH}-ld
export RANLIB=${CROSS_PATH}-ranlib


export CFLAGS="${CFLAGS} --sysroot=${SYSROOT} -I${SYSROOT}/usr/include -I${ANDROID_PREFIX}/include -DDISABLE_UTMP -DDISABLE_WTMP -DHAVE_GETPASS -fPIE"
export CPPFLAGS="${CFLAGS} -fPIE"
export LDFLAGS="${LDFLAGS} --sysroot=${SYSROOT} -L${SYSROOT}/usr/lib -L${ANDROID_PREFIX}/lib -fPIE -pie"

echo $CFLAGS

cd dropbear
autoconf
autoheader
./configure --host=${CROSS_COMPILE} "$@"
make -j4