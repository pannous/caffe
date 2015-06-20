template <class T> __kernel void DropoutForward(const int n, global float* in, global unsigned int* mask, const unsigned int threshold, const float scale, global float* out) {

	int idx = get_global_id(0);
	if ( idx < n ) {
		out[idx] = in[idx] * mask[idx] * scale;
	}
}
template __attribute__((mangled_name(DropoutForwardFloat))) kernel void DropoutForward(const int n, global float* in, global unsigned int* mask, const unsigned int threshold, const float scale, global float* out);

template <class T> __kernel void DropoutBackward(const int n, global float* in_diff, global unsigned int* mask, const unsigned int threshold, const float scale, global float* out_diff) {

	int idx = get_global_id(0);
	if ( idx < n ) {
	    out_diff[idx] = in_diff[idx] * scale * mask[idx];
	}
}
template __attribute__((mangled_name(DropoutBackwardFloat))) kernel void DropoutBackward(const int n, global float* in_diff, global unsigned int* mask, const unsigned int threshold, const float scale, global float* out_diff);
