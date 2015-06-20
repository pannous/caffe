__kernel void SigmoidForwardFloat(const int n, global float* in, global float* out) {

	int idx = get_global_id(0);
	if ( idx < n ) {
	    out[idx] = 1. / (1. + exp((float)-in[idx]));
	}
}
__kernel void SigmoidForwardDouble(const int n, global float* in, global float* out) {

	int idx = get_global_id(0);
	if ( idx < n ) {
	    out[idx] = 1. / (1. + exp((float)-in[idx]));
	}
}

__kernel void SigmoidBackwardFloat(const int n, global float* in_diff, global float* out_data, global float* out_diff) {

	int idx = get_global_id(0);
	if ( idx < n ) {
	    const float sigmoid_x = out_data[idx];
	    out_diff[idx] = in_diff[idx] * sigmoid_x * (1 - sigmoid_x);
	}
}
__kernel void SigmoidBackwardDouble(const int n, global float* in_diff, global float* out_data, global float* out_diff) {

	int idx = get_global_id(0);
	if ( idx < n ) {
	    const float sigmoid_x = out_data[idx];
	    out_diff[idx] = in_diff[idx] * sigmoid_x * (1 - sigmoid_x);
	}
}
