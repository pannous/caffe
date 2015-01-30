#!/bin/bash

caffe train \
  --solver=examples/mnist/mnist_autoencoder_solver_adagrad.prototxt
