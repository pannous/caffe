#!/usr/bin/env sh
cd $CAFFE_ROOT

./build/tools/caffe train --solver=examples/mnist/lenet_solver.prototxt
