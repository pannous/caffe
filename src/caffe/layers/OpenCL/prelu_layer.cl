template <class T> __kernel void PReLUForward(const int n, const int channels, const int dim, global float* in, global float* out, global float* slope_data, const int div_factor) {

	int idx = get_global_id(0);
	if ( idx < n ) {
    int c = (idx / dim) % channels / div_factor;
    out[idx] = in[idx] > 0 ? in[idx] : in[idx] * slope_data[c];
	}
}
template __attribute__((mangled_name(PReLUForwardFloat))) kernel void PReLUForward(const int n, const int channels, const int dim, global float* in, global float* out, global float* slope_data, const int div_factor);

template <class T> __kernel void PReLUBackward(const int n, const int channels, const int dim, global float* in_diff, global float* in_data, global float* out_diff, global float* slope_data, const int div_factor) {

	int idx = get_global_id(0);
	if ( idx < n ) {
    int c = (idx / dim) % channels / div_factor;
    out_diff[idx] = in_diff[idx] * ((in_data[idx] > 0) + (in_data[idx] <= 0) * slope_data[c]);
	}
}
template __attribute__((mangled_name(PReLUBackwardFloat))) kernel void PReLUBackward(const int n, const int channels, const int dim, global float* in_diff, global float* in_data, global float* out_diff, global float* slope_data, const int div_factor);

template <class T> __kernel void PReLUParamBackward(const int n, global float* in_diff, global float* in_data, global float* out_diff) {

	int idx = get_global_id(0);
	if ( idx < n ) {
    out_diff[idx] = in_diff[idx] * in_data[idx] * (in_data[idx] <= 0);
	}
}
template __attribute__((mangled_name(PReLUParamBackwardFloat))) kernel void PReLUParamBackward(const int n, global float* in_diff, global float* in_data, global float* out_diff);
