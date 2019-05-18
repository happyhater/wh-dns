#!/usr/bin/env bash

set -eE
set -o pipefail
set -x

version=`git describe --abbrev=4 --dirty --always --tags`

f() {
	make cleanfast; CGO_DISABLED=1 make
	if [[ $GOOS == darwin ]]; then
	    zip dist/whitehat_"$version"_MacOS.zip whitehat README.md LICENSE.txt
	elif [[ $GOOS == windows ]]; then
	    zip dist/whitehat_"$version"_Windows_"$GOARCH".zip whitehat.exe README.md LICENSE.txt
	else
	    rm -rf dist/whitehat
	    mkdir -p dist/whitehat
	    cp -pv {whitehat,LICENSE.txt,README.md} dist/whitehat/
	    pushd dist
	    tar zcvf whitehat_"$version"_"$GOOS"_"$GOARCH".tar.gz whitehat/{whitehat,LICENSE.txt,README.md}
	    popd
	    rm -rf dist/whitehat
	fi
}

# Clean dist and build
make clean
rm -rf dist

# Prepare the dist folder
mkdir -p dist

# Prepare releases
GOOS=darwin GOARCH=amd64 f
GOOS=linux GOARCH=amd64 f
GOOS=linux GOARCH=386 f
GOOS=linux GOARCH=arm GOARM=6 f
GOOS=linux GOARCH=arm64 GOARM=6 f
GOOS=windows GOARCH=amd64 f
GOOS=windows GOARCH=386 f
GOOS=linux GOARCH=mipsle GOMIPS=softfloat f
GOOS=linux GOARCH=mips GOMIPS=softfloat f
