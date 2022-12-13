echo "\033[1;32mCPython 3.11 Vita Port\033[0m"
./configure --build=x86_64-pc-linux-gnu --host=arm-vita-eabi --with-build-python=python3.11 --prefix="$VITASDK/arm-vita-eabi" --disable-test-modules --with-ensurepip=no --disable-ipv6 CONFIG_SITE="config.site" CFLAGS="-Wl,-q,-z,nocopyreloc" CPPFLAGS="-Wl,-q,-z,nocopyreloc"
make -j$(nproc)
make install

export PYTHON_BUILD=python311-vita-build
mkdir -p $PYTHON_BUILD
# Clean the Python Installation for a Smaller Lib file
rm $PYTHON_BUILD/python311.zip
rm -rf $PYTHON_BUILD/python3.11
cp -as $VITASDK/arm-vita-eabi/lib/python3.11 $PYTHON_BUILD
cd $PYTHON_BUILD/python3.11
# Clean all test modules
rm -rf test
rm -rf lib2to3/tests
rm -rf distutils/tests
rm -rf ctypes/test
rm -rf idlelib/idle_test
rm -rf tkinter/test
rm -rf unittest/test
rm -rf sqlite3/test
find . -type l -not -name \*.py -delete
find . -type d -empty -delete
python3.11 -OO -m compileall .
find . -type l -not -name \*.pyc -delete
7z a -l ../python311.zip .
cp ../python311.zip $VITASDK/arm-vita-eabi/lib
echo "Finished Installation"