#!/bin/bash

./configure.py --bootstrap

mkdir -p "$PREFIX/bin"

cp -p ninja "$PREFIX/bin/ninja"
