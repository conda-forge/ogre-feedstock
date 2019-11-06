#!/bin/sh

mkdir build
cd build

cmake .. \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_PREFIX_PATH=$PREFIX -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DOGRE_BUILD_RENDERSYSTEM_D3D9=FALSE \
      -DOGRE_BUILD_RENDERSYSTEM_GL=TRUE \
      -DOGRE_BUILD_RENDERSYSTEM_GL3PLUS=TRUE \
      -DOGRE_BUILD_COMPONENT_JAVA=FALSE \
      -DOGRE_BUILD_SAMPLES=FALSE \
      -DOGRE_BUILD_TESTS=FALSE \
      -DOGRE_BUILD_DEPENDENCIES=FALSE \
      -DOGRE_BUILD_TOOLS=FALSE \
      -DOGRE_INSTALL_PDB=FALSE \
      -DOGRE_RESOURCEMANAGER_STRICT=0 \
      -DOGRE_THREAD_SUPPORT=2 \
      -DOGRE_THREAD_PROVIDER=1
make -j${CPU_COUNT}
make install
