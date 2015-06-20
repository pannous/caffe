__kernel void TanHForwardFloat(const int n, global float* in, global float* out) {

	int idx = get_global_id(0);
	if ( idx < n ) {
    //T exp2x = exp(2 * in[idx]);
    //out[idx] = (exp2x - 1.0) / (exp2x + 1.0);
	  out[idx] = tanh((float)in[idx]);
	}
}
__kernel void TanHForwardDouble(const int n, global float* in, global float* out) {

	int idx = get_global_id(0);
	if ( idx < n ) {
    //T exp2x = exp(2 * in[idx]);
    //out[idx] = (exp2x - 1.0) / (exp2x + 1.0);
	  out[idx] = tanh((float)in[idx]);
	}
}

__kernel void TanHBackwardFloat(const int n, global float* in_diff, global float* out_data, global float* out_diff) {

	int idx = get_global_id(0);
	if ( idx < n ) {
	    float tanhx = out_data[idx];
	    out_diff[idx] = in_diff[idx] * (1.0 - tanhx * tanhx);	    
	}
}
__kernel void TanHBackwardDouble(const int n, global float* in_diff, global float* out_data, global float* out_diff) {

	int idx = get_global_id(0);
	if ( idx < n ) {
	    float tanhx = out_data[idx];
	    out_diff[idx] = in_diff[idx] * (1.0 - tanhx * tanhx);	    
	}
}
