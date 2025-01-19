:: MSVC is preferred.
set CC=cl.exe
set CXX=cl.exe

mkdir build
cd build
cmake ^
    -G "Ninja" ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_CXX_FLAGS=-EHsc ^
    -DOGRE_BUILD_RENDERSYSTEM_D3D9=FALSE ^
    -DOGRE_BUILD_RENDERSYSTEM_GL=TRUE ^
    -DOGRE_BUILD_RENDERSYSTEM_GL3PLUS=TRUE ^
    -DOGRE_BUILD_COMPONENT_JAVA=FALSE ^
    -DOGRE_BUILD_SAMPLES=FALSE ^
    -DOGRE_BUILD_TESTS=FALSE ^
    -DOGRE_BUILD_DEPENDENCIES=FALSE ^
    -DOGRE_BUILD_TOOLS=FALSE ^
    -DOGRE_INSTALL_PDB=FALSE ^
    -DOGRE_RESOURCEMANAGER_STRICT=0 ^
    -DOGRE_THREAD_SUPPORT=2 ^
    -DOGRE_THREAD_PROVIDER=1 ^
    -DOGRE_CONFIG_ENABLE_ZIP=ON ^
    %SRC_DIR%
if errorlevel 1 exit 1

:: Build.
cmake --build . --config Release
if errorlevel 1 exit 1

:: Install.
cmake --build . --config Release --target install
if errorlevel 1 exit 1
