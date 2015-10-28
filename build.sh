#!/usr/bin/env bash

set -o errexit
set -o nounset

target_os=linux

if [[ -z ${1-} ]]; then
  echo "using linux as default"
elif [[ ${1} == "arm-linux" ]]; then
  target_os=arm-linux
elif [[ ${1} == "android" ]]; then
  target_os=android
fi

readonly target_os
readonly script_dir=$(cd $(dirname $BASH_SOURCE[0]); pwd)
readonly source_dir=${script_dir}
readonly output_dir=${script_dir}/output/${target_os}


cmake_extra_args="-DLINUX=1"
if [[ ${target_os} == "arm-linux" ]]; then
  cmake_extra_args="-DCMAKE_TOOLCHAIN_FILE=${source_dir}/arm-linux-gnueabihf.toolchain.cmake \
                    -DARM_LINUX=1
                   "
elif [[ ${target_os} == "android" ]]; then
  cmake_extra_args="-DCMAKE_TOOLCHAIN_FILE=${source_dir}/android.toolchain.cmake \
                    -DANDROID_NDK=${ANDROID_NDK} \
                    -DANDROID_NATIVE_API_LEVEL=android-21 \
                    -DANDROID=1
                   "
fi

mkdir -p ${output_dir}
cd ${output_dir}
cmake ${cmake_extra_args} ${source_dir}
make -j4
