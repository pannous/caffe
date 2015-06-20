template <class T> __kernel void SigmoidForward(const int n, global float* in, global float* out) {

	int idx = get_global_id(0);
	if ( idx < n ) {
	    out[idx] = 1. / (1. + exp((float)-in[idx]));
	}
}
template __attribute__((mangled_name(SigmoidForwardFloat))) kernel void SigmoidForward(const int n, global float* in, global float* out);
template __attribute__((mangled_name(SigmoidForwardDouble))) kernel void SigmoidForward(const int n, global float* in, global float* out);

template <class T> __kernel void SigmoidBackward(const int n, global float* in_diff, global float* out_data, global float* out_diff) {

	int idx = get_global_id(0);
	if ( idx < n ) {
	    const float sigmoid_x = out_data[idx];
	    out_diff[idx] = in_diff[idx] * sigmoid_x * (1 - sigmoid_x);
	}
}
template __attribute__((mangled_name(SigmoidBackwardFloat))) kernel void SigmoidBackward(const int n, global float* in_diff, global float* out_data, global float* out_diff);
template __attribute__((mangled_name(SigmoidBackwardDouble))) kernel void SigmoidBackward(const int n, global float* in_diff, global float* out_data, global float* out_diff);