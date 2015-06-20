#define KBNLL_THRESHOLD 50.0

template <class T> __kernel void BNLLForward(const int n, global float* in, global float* out) {

	int idx = get_global_id(0);
	if ( idx < n ) {
	    out[idx] = in[idx] > 0 ? in[idx] + log(1. + exp((float)-in[idx])) : log(1. + exp((float)in[idx]));
	}
}
template __attribute__((mangled_name(BNLLForwardFloat))) kernel void BNLLForward(const int n, global float* in, global float* out);

template <class T> __kernel void BNLLBackward(const int n, global float* in_diff, global float* in_data, global float* out_diff) {

	int idx = get_global_id(0);
	if ( idx < n ) {
	    T expval = exp(min((float)in_data[idx], ( float ) KBNLL_THRESHOLD));
	    out_diff[idx] = in_diff[idx] * expval / (expval + 1.);
	}
}
template __attribute__((mangled_name(BNLLBackwardFloat))) kernel void BNLLBackward(const int n, global float* in_diff, global float* in_data, global float* out_diff);
