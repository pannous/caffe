// This file was auto-generated from file 'src/caffe/layers/OpenCL/lrn_layer.cl' to conform to standard OpenCL
__kernel void LRNFillScaleFloat(const int nthreads, const global float* in, const int num, const int channels, const int height, const int width, const int size, const float alpha_over_size, const float k, global float* scale) {

	int idx = get_global_id(0);
	if ( idx < nthreads ) {
		
    // find out the local offset
    int w = idx % width;
    int h = (idx / width) % height;
    int n = idx / width / height;
    int offset = (n * channels * height + h) * width + w;
    int step = height * width;
    in += offset;
    scale += offset;
    int head = 0;
    int pre_pad = (size - 1) / 2;
    int post_pad = size - pre_pad - 1;
    float accum_scale = 0;
    // fill the scale at [n, :, h, w]
    // accumulate values
    while (head < post_pad && head < channels) {
      accum_scale += in[head * step] * in[head * step];
      ++head;
    }
    // both add and subtract
    while (head < channels) {
      accum_scale += in[head * step] * in[head * step];
      if (head - size >= 0) {
        accum_scale -= in[(head - size) * step] * in[(head - size) * step];
      }
      scale[(head - post_pad) * step] = k + accum_scale * alpha_over_size;
      ++head;
    }
    // subtract only
    while (head < channels + post_pad) {
      if (head - size >= 0) {
        accum_scale -= in[(head - size) * step] * in[(head - size) * step];
      }
      scale[(head - post_pad) * step] = k + accum_scale * alpha_over_size;
      ++head;
    }		
	}
}

// TODO: check if it would be faster to just put it into the previous kernel.
__kernel void LRNComputeOutputFloat(const int nthreads, const global float* in, const global float* scale, const float negative_beta, global float* out) {
	
	int idx = get_global_id(0);
	if ( idx < nthreads ) {
	    out[idx] = in[idx] * pow((float)scale[idx], negative_beta);		
	}
}


__kernel void LRNComputeDiffFloat(const int nthreads, const global float* bottom_data, const global float* top_data, const global float* scale, const global float* top_diff, const int num, const int channels, const int height, const int width, const int size, const float negative_beta, const float cache_ratio, global float* bottom_diff) {
	
	int idx = get_global_id(0);
	if ( idx < nthreads ) {

    // find out the local offset
    int w = idx % width;
    int h = (idx / width) % height;
    int n = idx / width / height;
    int offset = (n * channels * height + h) * width + w;
    int step = height * width;
    bottom_data += offset;
    top_data += offset;
    scale += offset;
    top_diff += offset;
    bottom_diff += offset;
    int head = 0;
    int pre_pad = size - (size + 1) / 2;
    int post_pad = size - pre_pad - 1;
    float accum_ratio = 0;
    // accumulate values
    while (head < post_pad && head < channels) {
      accum_ratio += top_diff[head * step] * top_data[head * step] /
          scale[head * step];
      ++head;
    }
    // both add and subtract
    while (head < channels) {
      accum_ratio += top_diff[head * step] * top_data[head * step] /
          scale[head * step];
      if (head - size >= 0) {
        accum_ratio -= top_diff[(head - size) * step] *
            top_data[(head - size) * step] / scale[(head - size) * step];
      }
      bottom_diff[(head - post_pad) * step] = top_diff[(head - post_pad) * step]
          * pow((float)scale[(head - post_pad) * step], negative_beta) - cache_ratio *
          bottom_data[(head - post_pad) * step] * accum_ratio;
      ++head;
    }
    // subtract only
    while (head < channels + post_pad) {
      if (head - size >= 0) {
        accum_ratio -= top_diff[(head - size) * step] *
            top_data[(head - size) * step] / scale[(head - size) * step];
      }
      bottom_diff[(head - post_pad) * step] = top_diff[(head - post_pad) * step]
          * pow((float)scale[(head - post_pad) * step], (float)negative_beta) - cache_ratio *
          bottom_data[(head - post_pad) * step] * accum_ratio;
      ++head;
    }

	
	}
}
