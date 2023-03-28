#!/bin/sh
echo -e "\033[1;32mCompiling Python Modules\033[0m"
if [ -z "$1" ]
    then
        export PREFIX=$VITASDK/arm-vita-eabi
    else
        export PREFIX=$1/$VITASDK/arm-vita-eabi
fi

export PYTHON_BUILD=python311-vita-build
mkdir -p $PYTHON_BUILD
# Clean the Python Installation for a Smaller Lib file
rm $PYTHON_BUILD/python311.zip
rm -rf $PYTHON_BUILD/python3.11
cp -as $PREFIX/lib/python3.11 $PYTHON_BUILD
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
python3.11 -OO -m compileall -j 0 -b .
find . -type l -not -name \*.pyc -delete
7z a -l ../python311.zip .
cp ../python311.zip $PREFIX/lib
cp ../../Modules/_decimal/libmpdec/libmpdec.a $PREFIX/lib