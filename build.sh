#!/bin/bash

RED='\033[0;31m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

function log {
    echo -e "${YELLOW} $@ ${NC}"
}

function rmake {
    log "-> $3 $(pwd)/$1 ..."
    ( cd $1 && make -j $2)
}

function install {
    log "-> $2 src/$1/$1 to bin/$1"
    cp src/$1/$1 bin/
}

function call {
    while read line; do 
        $1 $line ${@:2}
    done
}

function build {
    echo "$DIRS"     | call rmake all "Building directory :"
    echo "$PROGRAMS" | call install "Installing "
}

function clean {
    echo "$DIRS"     | call rmake clean "Clean directory :"
}

PROGRAMS=$(cat)
DIRS=$(echo "$PROGRAMS" |sed -e 's/^/src\//' )
$@
