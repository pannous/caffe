template <class T> __kernel void TanHForward(const int n, global float* in, global float* out) {

	int idx = get_global_id(0);
	if ( idx < n ) {
    //T exp2x = exp(2 * in[idx]);
    //out[idx] = (exp2x - 1.0) / (exp2x + 1.0);
	  out[idx] = tanh((float)in[idx]);
	}
}
template __attribute__((mangled_name(TanHForwardFloat))) kernel void TanHForward(const int n, global float* in, global float* out);
template __attribute__((mangled_name(TanHForwardDouble))) kernel void TanHForward(const int n, global float* in, global float* out);

template <class T> __kernel void TanHBackward(const int n, global float* in_diff, global float* out_data, global float* out_diff) {

	int idx = get_global_id(0);
	if ( idx < n ) {
	    T tanhx = out_data[idx];
	    out_diff[idx] = in_diff[idx] * (1.0 - tanhx * tanhx);	    
	}
}
template __attribute__((mangled_name(TanHBackwardFloat))) kernel void TanHBackward(const int n, global float* in_diff, global float* out_data, global float* out_diff);
template __attribute__((mangled_name(TanHBackwardDouble))) kernel void TanHBackward(const int n, global float* in_diff, global float* out_data, global float* out_diff);
