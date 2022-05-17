#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://github.com/tektoncd/cli/releases/download

dl() {
    local app=$1
    local ver=$2
    local lchecksums=$3
    local os=$4
    local arch=$5
    local archive_type=${6:-tar.gz}
    local platform="${os}_${arch}"
    local file="${app}_${ver}_${platform}.${archive_type}"
    local url="$MIRROR/v$ver/$file"
    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(grep $file $lchecksums | awk '{print $1}')
}

dl_ver() {
    local app=$1
    local ver=$2
    # https://github.com/tilt-dev/tilt/releases/download/v0.22.5/checksums.txt
    local url="$MIRROR/v$ver/checksums.txt"
    local lchecksums="$DIR/${app}_${ver}_checksums.txt"
    if [ ! -e $lchecksums ];
    then
        curl -sSLf -o $lchecksums $url
    fi

    printf "  # %s\n" $url
    printf "  '%s':\n" $ver

    dl $app $ver $lchecksums Darwin arm64
    dl $app $ver $lchecksums Darwin x86_64
    dl $app $ver $lchecksums Linux arm64
    dl $app $ver $lchecksums Linux ppc64le
    dl $app $ver $lchecksums Linux s390x
    dl $app $ver $lchecksums Linux x86_64
    dl $app $ver $lchecksums Windows arm64 zip
    dl $app $ver $lchecksums Windows x86_64 zip
}

dl_ver tkn ${1:-0.23.1}
