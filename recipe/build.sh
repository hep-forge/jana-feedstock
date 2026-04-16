#!/usr/bin/env bash

# Install conda activate/deactivate scripts (sets JANA_HOME)
mkdir -p build-scripts
cd build-scripts
cmake "$RECIPE_DIR/scripts"
cd ..

cmake -S . -B build \
    -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=$(root-config --cxxstandard) \
    -DUSE_ROOT=ON \
    -DUSE_PYTHON=ON \
    -DUSE_ZEROMQ=ON \
    -DUSE_XERCES=ON \
    -DXercesC_DIR="${PREFIX}" \
    -DUSE_PODIO=ON \
    -DBUILD_EXAMPLES=OFF \
    -DBUILD_TESTS=OFF

cmake --build build --parallel "${CPU_COUNT}"
cmake --install build
