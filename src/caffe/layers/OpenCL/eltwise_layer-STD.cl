// This file was auto-generated from file 'src/caffe/layers/OpenCL/eltwise_layer.cl' to conform to standard OpenCL

__kernel void MaxForwardFloat(const int nthreads, const global float* bottom_data_a, const global float* bottom_data_b, const int blob_idx, global float* top_data, global int* mask) {

	int idx = get_global_id(0);
	if ( idx < nthreads ) {
		
	 float maxval = -FLT_MAX;
		int maxidx = -1;
	    if (bottom_data_a[idx] > bottom_data_b[idx]) {
	    	// only update for very first bottom_data blob (blob_idx == 0)
	    	if (blob_idx == 0) {
	    		maxval = bottom_data_a[idx];
	    		top_data[idx] = maxval;
	    		maxidx = blob_idx;
	    		mask[idx] = maxidx;
	    	}
	    } else {
	    	maxval = bottom_data_b[idx];
	    	top_data[idx] = maxval;
	    	maxidx = blob_idx + 1;
	    	mask[idx] = maxidx;
	    }
	}
}

__kernel void MaxBackwardFloat(const int nthreads, const global float* top_diff, const int blob_idx, const global int* mask, global float* bottom_diff) {

	int idx = get_global_id(0);
	if ( idx < nthreads ) {
	 float gradient = 0;
		if (mask[idx] == blob_idx) {
			gradient += top_diff[idx];
		}
		bottom_diff[idx] = gradient;	
	}
}
