// This file was auto-generated from file 'src/caffe/layers/OpenCL/dropout_layer.cl' to conform to standard OpenCL
__kernel void DropoutForwardFloat(const int n, global float* in, global unsigned int* mask, const unsigned int threshold, const float scale, global float* out) {

	int idx = get_global_id(0);
	if ( idx < n ) {
		out[idx] = in[idx] * mask[idx] * scale;
	}
}

__kernel void DropoutBackwardFloat(const int n, global float* in_diff, global unsigned int* mask, const unsigned int threshold, const float scale, global float* out_diff) {

	int idx = get_global_id(0);
	if ( idx < n ) {
	    out_diff[idx] = in_diff[idx] * scale * mask[idx];
	}
}
