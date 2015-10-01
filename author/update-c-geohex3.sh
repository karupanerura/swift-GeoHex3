#!/bin/bash
cd $(dirname $0)
cp -f ./deps/c-geohex3/lib/geohex3.c           ../Pod/Classes/lib/geohex3.c
cp -f ./deps/c-geohex3/lib/include/pow.h       ../Pod/Classes/lib/pow.h
cp -f ./deps/c-geohex3/include/geohex3.h       ../Pod/Classes/lib/geohex3.h
cp -f ./deps/c-geohex3/include/geohex3/macro.h ../Pod/Classes/lib/geohex3/macro.h
