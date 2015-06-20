// This file was auto-generated from file 'src/caffe/layers/OpenCL/bnll_layer.cl' to conform to standard OpenCL
#define KBNLL_THRESHOLD 50.0

__kernel void BNLLForwardFloat(const int n, global float* in, global float* out) {

	int idx = get_global_id(0);
	if ( idx < n ) {
	    out[idx] = in[idx] > 0 ? in[idx] + log(1. + exp((float)-in[idx])) : log(1. + exp((float)in[idx]));
	}
}

__kernel void BNLLBackwardFloat(const int n, global float* in_diff, global float* in_data, global float* out_diff) {

	int idx = get_global_id(0);
	if ( idx < n ) {
	    float expval = exp(min((float)in_data[idx], ( float ) KBNLL_THRESHOLD));
	    out_diff[idx] = in_diff[idx] * expval / (expval + 1.);
	}
}
