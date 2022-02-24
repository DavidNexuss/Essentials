#!/bin/bash

RED='\033[0;31m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

function log {
    echo -e "${YELLOW} $@ ${NC}"
}

function operation {
    log "-> Calling ${@:2} on $(pwd)/$1 ..."
    ( cd $1 && ${@:2} > /dev/null)
}

function rinstall {
    log "-> $2 src/$1/$1 to bin/$1"
    rm -f bin/$1
    cp src/$1/$1 bin/
}

function call {
    while read line; do 
        $1 $line ${@:2}
    done
}

function build {
    echo "$DIRS"     | call operation make -j all
    echo "$PROGRAMS" | call rinstall "Installing "
}

function clean {
    echo "$DIRS"     | call operation make clean
}

function forall {
    echo "$DIRS" | call operation $@
}

PROGRAMS=$(cat)
DIRS=$(echo "$PROGRAMS" |sed -e 's/^/src\//' )
$@
