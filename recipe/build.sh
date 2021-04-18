#!/bin/sh

mkdir build
cd build

# This is needed as otherwise the log limit exceeds on Travis
if [ ${target_platform} == "linux-ppc64le" ]; then
  WARNING_FLAGS=-DCMAKE_CXX_FLAGS="-Wno-deprecated-copy"
else
  WARNING_FLAGS=
fi

if [[ "${target_platform}" == "osx-arm64" ]]; then
      OGRE_OSX_ARCH="-DCMAKE_OSX_ARCHITECTURES=arm64"
fi

cmake ${CMAKE_ARGS} .. \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_PREFIX_PATH=$PREFIX \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DOGRE_BUILD_RENDERSYSTEM_D3D9=FALSE \
      -DOGRE_BUILD_RENDERSYSTEM_GL=TRUE \
      -DOGRE_BUILD_RENDERSYSTEM_GL3PLUS=TRUE \
      -DOGRE_BUILD_COMPONENT_JAVA=FALSE \
      -DOGRE_BUILD_TESTS=FALSE \
      -DOGRE_BUILD_DEPENDENCIES=FALSE \
      -DOGRE_BUILD_TOOLS=FALSE \
      -DOGRE_BUILD_SAMPLES=FALSE \
      -DOGRE_INSTALL_PDB=FALSE \
      -DOGRE_RESOURCEMANAGER_STRICT=0 \
      -DOGRE_CONFIG_THREAD_PROVIDER="std" \
      -DOGRE_BUILD_LIBS_AS_FRAMEWORKS=0 \
      ${WARNING_FLAGS} \
      ${OGRE_OSX_ARCH}

make -j${CPU_COUNT}
make install
