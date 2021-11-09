#!/bin/bash
set -e

upstream_version=4.8.1
wget https://github.com/Unidata/netcdf-c/archive/v${upstream_version}.tar.gz
tar -xf v${upstream_version}.tar.gz
cd netcdf-*
./configure --prefix=/builddir     -enable-shared  --disable-static
make -j4 LDFLAGS="-no-undefined  -Wl,--export-all-symbols"
make check
make install
