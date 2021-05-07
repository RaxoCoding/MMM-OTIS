pushd "%SRC_DIR%"\build\cmake
cmake -GNinja ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
    -DCMAKE_INSTALL_LIBDIR="lib" ^
    -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%"
cmake --build . --target install
copy %PREFIX%\Library\bin\zstd.dll %PREFIX%\Library\bin\libzstd.dll
copy %PREFIX%\Library\lib\zstd.lib %PREFIX%\Library\lib\libzstd.lib
copy %PREFIX%\Library\lib\zstd_static.lib %PREFIX%\Library\lib\libzstd_static.lib
