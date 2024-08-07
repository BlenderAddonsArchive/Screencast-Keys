#!/bin/sh

if [ $# -ne 2 ]; then
    echo "Usage: tools/install.sh <os> <version>"
    exit 1
fi

os=${1}
version=${2}
target=""

if [ "${os}" = "mac" ]; then
    addon_dir="${HOME}/Library/Application Support/Blender/${version}/extensions/user_default"
    mkdir -p "${addon_dir}"
    target="${addon_dir}/screencast_keys"
elif [ "${os}" = "linux" ]; then
    addon_dir="${HOME}/.config/blender/${version}/extensions/user_default"
    mkdir -p "${addon_dir}"
    target="${addon_dir}/screencast_keys"
else
    echo "Invalid operating system."
    exit 1
fi

rm -rf "${target}"
cp -r src/screencast_keys "${target}"
