__kernel void ReLUForwardFloat(const int n, global float* in, global float* out, float negative_slope) {

	int idx = get_global_id(0);
	if ( idx < n ) {
		out[idx] = in[idx] > 0 ? in[idx] : in[idx] * negative_slope;
	}
}
__kernel void ReLUForwardDouble(const int n, global float* in, global float* out, float negative_slope) {

	int idx = get_global_id(0);
	if ( idx < n ) {
		out[idx] = in[idx] > 0 ? in[idx] : in[idx] * negative_slope;
	}
}

__kernel void ReLUBackwardFloat(const int n, global float* in_diff, global float* in_data, global float* out_diff, float negative_slope) {

	int idx = get_global_id(0);
	if ( idx < n ) {
		out_diff[idx] = in_diff[idx] * ((in_data[idx] > 0) + (in_data[idx] <= 0) * negative_slope);
	}
}
__kernel void ReLUBackwardDouble(const int n, global float* in_diff, global float* in_data, global float* out_diff, float negative_slope) {

	int idx = get_global_id(0);
	if ( idx < n ) {
		out_diff[idx] = in_diff[idx] * ((in_data[idx] > 0) + (in_data[idx] <= 0) * negative_slope);
	}
}
