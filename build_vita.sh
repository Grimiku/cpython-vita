#!/bin/sh
echo "\033[1;32mCPython 3.11 Vita Port\033[0m"
if [ -z "$1" ]
    then
        export PREFIX=$VITASDK/arm-vita-eabi
    else
        export PREFIX=$1/$VITASDK/arm-vita-eabi
fi

./configure --build=x86_64-pc-linux-gnu --host=arm-vita-eabi --with-build-python=python3.11 --prefix="$PREFIX" --disable-test-modules --with-ensurepip=no --disable-ipv6 CONFIG_SITE="config.site" CFLAGS="-Wl,-q,-z,nocopyreloc" CPPFLAGS="-Wl,-q,-z,nocopyreloc"
make -j$(nproc)
make install