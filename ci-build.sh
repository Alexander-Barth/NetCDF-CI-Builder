#!/bin/bash
set -e

upstream_version=4.8.1

git clone https://github.com/Alexander-Barth/Yggdrasil

wget https://github.com/Unidata/netcdf-c/archive/v${upstream_version}.tar.gz
tar -xf v${upstream_version}.tar.gz
cd netcdf-*

for p in ~/Yggdrasil/N/NetCDF/bundled/patches/*.patch; do
    patch -p1 "${p}"
done

export CFLAGS="-std=c99"
./configure --disable-testsets  --enable-shared  --disable-static  --disable-dap-remote-tests

make -j4 LDFLAGS="-no-undefined  -Wl,--export-all-symbols"
make check
make install
