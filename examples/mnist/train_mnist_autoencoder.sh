#!/usr/bin/env sh
caffe train --solver=mnist_autoencoder_solver.prototxt $@
