// This file was auto-generated from file 'src/caffe/layers/OpenCL/softmax_layer.cl' to conform to standard OpenCL
__kernel void kernel_channel_maxFloat(const int num, const int channels, const int spatial_dim, const global float* data, global float* out) {

	int idx = get_global_id(0);
	if ( idx < num*spatial_dim ) {
	    int n = idx / spatial_dim;
	    int s = idx % spatial_dim;
	    float maxval = -FLT_MAX;
	    for (int c = 0; c < channels; ++c) {
	      maxval = max((float)data[(n * channels + c) * spatial_dim + s],(float) maxval);
	    }
	    out[idx] = maxval;
	}
}

__kernel void kernel_channel_subtractFloat(const int num, const int channels, const int spatial_dim, global float* data, const global float* channel_max) {

	int idx = get_global_id(0);
	if ( idx < num*spatial_dim ) {
	    int n = idx / spatial_dim;
	    int s = idx % spatial_dim;
	    for (int c = 0; c < channels; ++c) {
	      data[(n * channels + c) * spatial_dim + s] -= channel_max[idx];
	    }
	}
}

__kernel void kernel_expFloat(const int count, const global float* data, global float* out) {

	int idx = get_global_id(0);
	if ( idx < count ) {
		 out[idx] = exp(data[idx]);
	}
}

__kernel void kernel_channel_sumFloat(const int num, const int channels,const int spatial_dim, const global float* data, global float* channel_sum) {

	int idx = get_global_id(0);
	if ( idx < num*spatial_dim ) {
	    int n = idx / spatial_dim;
	    int s = idx % spatial_dim;
	    float sum = 0;
	    for (int c = 0; c < channels; ++c) {
	      sum += data[(n * channels + c) * spatial_dim + s];
	    }
	    channel_sum[idx] = sum;
	}
}

__kernel void kernel_channel_divFloat(const int num, const int channels, const int spatial_dim, global float* data, const global float* channel_sum) {

	int idx = get_global_id(0);
	if ( idx < num*spatial_dim ) {
	    int n = idx / spatial_dim;
	    int s = idx % spatial_dim;
	    for (int c = 0; c < channels; ++c) {
	      data[(n * channels + c) * spatial_dim + s] /= channel_sum[idx];
	    }
	}
}

__kernel void kernel_channel_dotFloat(const int num, const int channels, const int spatial_dim, const global float* data_1, const global float* data_2,  global float* channel_dot) {

	int idx = get_global_id(0);
	if ( idx < num*spatial_dim ) {
	    int n = idx / spatial_dim;
	    int s = idx % spatial_dim;
	    float dot = 0;
	    for (int c = 0; c < channels; ++c) {
	      dot += (data_1[(n * channels + c) * spatial_dim + s] * data_2[(n * channels + c) * spatial_dim + s]);
	    }
	    channel_dot[idx] = dot;
	}
}






























