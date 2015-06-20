template <class T> __kernel void kernel_channel_max(const int num, const int channels, const int spatial_dim, const global float* data, global float* out) {

	int idx = get_global_id(0);
	if ( idx < num*spatial_dim ) {
	    int n = idx / spatial_dim;
	    int s = idx % spatial_dim;
	    T maxval = -FLT_MAX;
	    for (int c = 0; c < channels; ++c) {
	      maxval = max((float)data[(n * channels + c) * spatial_dim + s],(float) maxval);
	    }
	    out[idx] = maxval;
	}
}
template __attribute__((mangled_name(kernel_channel_maxFloat))) kernel void kernel_channel_max(const int num, const int channels, const int spatial_dim, const global float* data, global float* out);

template <class T> __kernel void kernel_channel_subtract(const int num, const int channels, const int spatial_dim, global float* data, const global float* channel_max) {

	int idx = get_global_id(0);
	if ( idx < num*spatial_dim ) {
	    int n = idx / spatial_dim;
	    int s = idx % spatial_dim;
	    for (int c = 0; c < channels; ++c) {
	      data[(n * channels + c) * spatial_dim + s] -= channel_max[idx];
	    }
	}
}
template __attribute__((mangled_name(kernel_channel_subtractFloat))) kernel void kernel_channel_subtract(const int num, const int channels, const int spatial_dim, global float* data, const global float* channel_max);

template <class T> __kernel void kernel_exp(const int count, const global float* data, global float* out) {

	int idx = get_global_id(0);
	if ( idx < count ) {
		 out[idx] = exp(data[idx]);
	}
}
template __attribute__((mangled_name(kernel_expFloat))) kernel void kernel_exp(const int count, const global float* data, global float* out);

template <class T> __kernel void kernel_channel_sum(const int num, const int channels,const int spatial_dim, const global float* data, global float* channel_sum) {

	int idx = get_global_id(0);
	if ( idx < num*spatial_dim ) {
	    int n = idx / spatial_dim;
	    int s = idx % spatial_dim;
	    T sum = 0;
	    for (int c = 0; c < channels; ++c) {
	      sum += data[(n * channels + c) * spatial_dim + s];
	    }
	    channel_sum[idx] = sum;
	}
}
template __attribute__((mangled_name(kernel_channel_sumFloat))) kernel void kernel_channel_sum(const int num, const int channels,const int spatial_dim, const global float* data, global float* channel_sum);

template <class T> __kernel void kernel_channel_div(const int num, const int channels, const int spatial_dim, global float* data, const global float* channel_sum) {

	int idx = get_global_id(0);
	if ( idx < num*spatial_dim ) {
	    int n = idx / spatial_dim;
	    int s = idx % spatial_dim;
	    for (int c = 0; c < channels; ++c) {
	      data[(n * channels + c) * spatial_dim + s] /= channel_sum[idx];
	    }
	}
}
template __attribute__((mangled_name(kernel_channel_divFloat))) kernel void kernel_channel_div(const int num, const int channels, const int spatial_dim, global float* data, const global float* channel_sum);

template <class T> __kernel void kernel_channel_dot(const int num, const int channels, const int spatial_dim, const global float* data_1, const global float* data_2,  global float* channel_dot) {

	int idx = get_global_id(0);
	if ( idx < num*spatial_dim ) {
	    int n = idx / spatial_dim;
	    int s = idx % spatial_dim;
	    T dot = 0;
	    for (int c = 0; c < channels; ++c) {
	      dot += (data_1[(n * channels + c) * spatial_dim + s] * data_2[(n * channels + c) * spatial_dim + s]);
	    }
	    channel_dot[idx] = dot;
	}
}
template __attribute__((mangled_name(kernel_channel_dotFloat))) kernel void kernel_channel_dot(const int num, const int channels, const int spatial_dim, const global float* data_1, const global float* data_2,  global float* channel_dot);






























