
__kernel void ThresholdForwardFloat(const int n, const float threshold, const global float* in, global float* out) {

	int idx = get_global_id(0);
	if ( idx < n ) {
	    out[idx] = in[idx] > threshold ? 1 : 0;
	}
}
