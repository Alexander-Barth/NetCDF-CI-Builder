#!/bin/bash

upstream_version=4.8.1
wget https://github.com/Unidata/netcdf-c/archive/v${upstream_version}.tar.gz
tar -xf v${upstream_version}.tar.gz
cd netcdf-*
./configure --prefix=/builddir
make -j4
make check
make install
