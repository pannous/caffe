// This file was auto-generated from file 'src/caffe/layers/OpenCL/contrastive_loss_layer.cl' to conform to standard OpenCL
__kernel void CLLForwardFloat(const int count, const int channels, const float margin, const float alpha, global float* y, global float* diff, global float* dist_sq, global float *bottom_diff) {
	
	int idx = get_global_id(0);
		
	if ( idx < count ) {
		int n = idx / channels;  // the num index, to access y and dist_sq
		if ( (int) y[n] ) {  // similar pairs
			bottom_diff[idx] = alpha * diff[idx];
		} else {  // dissimilar pairs
			if ((margin-dist_sq[n]) > 0.0) {
				bottom_diff[idx] = -alpha * diff[idx];
			} else {
				bottom_diff[idx] = 0;
			}
		}
	}	
}
__kernel void CLLForwardDouble(const int count, const int channels, const float margin, const float alpha, global float* y, global float* diff, global float* dist_sq, global float *bottom_diff) {
	
	int idx = get_global_id(0);
		
	if ( idx < count ) {
		int n = idx / channels;  // the num index, to access y and dist_sq
		if ( (int) y[n] ) {  // similar pairs
			bottom_diff[idx] = alpha * diff[idx];
		} else {  // dissimilar pairs
			if ((margin-dist_sq[n]) > 0.0) {
				bottom_diff[idx] = -alpha * diff[idx];
			} else {
				bottom_diff[idx] = 0;
			}
		}
	}	
}
