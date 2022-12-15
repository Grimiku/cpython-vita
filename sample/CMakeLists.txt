cmake_minimum_required(VERSION 3.0)

set(CMAKE_TOOLCHAIN_FILE "$ENV{VITASDK}/share/vita.toolchain.cmake" CACHE PATH "VITASDK toolchain file")
set(VITASDK_CMAKE_FILE "$ENV{VITASDK}/share/vita.cmake" CACHE PATH "VITASDK CMake functions file")
include("${VITASDK_CMAKE_FILE}" REQUIRED)

project(cpython-simple-example LANGUAGES C)

include_directories(
  "$ENV{VITASDK}/arm-vita-eabi/include/python3.11"
)

# Build self

set(ELF "simple.elf")
set(SELF "simple.self")

find_package(OpenSSL REQUIRED)

add_executable("${ELF}"
  main.c
)

target_link_libraries("${ELF}"
  python3.11
  intl
  mpdec
  SceIofilemgr_stub
  SceAppMgr_stub
  SceNet_stub
  SceNetCtl_stub
  SceSsl_stub
  SceSysmodule_stub
  SceLibKernel_stub 
  ${OPENSSL_LIBRARIES}
  pthread
  z
  m
)

vita_create_self(eboot.bin
  "${ELF}"
)

# Build VPK

set(VPK "cpython-311-simple-example.vpk")
set(TITLE_NAME "CPython 3.11 Simple Example")
set(TITLE_ID "PYTH00003")
set(TITLE_VER "01.00")

vita_create_vpk("${VPK}" "${TITLE_ID}" eboot.bin
  NAME "${TITLE_NAME}"
  VERSION "${TITLE_VER}"
  FILE "$ENV{VITASDK}/arm-vita-eabi/lib/python311.zip" lib/python311.zip
  FILE main.py main.py
)