#!/bin/sh
cur=$(pwd)
cd "$(dirname "$0")"
DIR=$(cd ..; cd bin; pwd)
export PATH=$DIR:$PATH
cd $cur
