// This file was auto-generated from file 'src/caffe/util/OpenCL/im2col.cl' to conform to standard OpenCL
#pragma OPENCL EXTENSION cl_khr_fp64 : enable
#if defined(cl_khr_fp64)
#pragma OPENCL EXTENSION cl_khr_fp64 : enable
#endif
		
#if defined(cl_amd_printf)
#pragma OPENCL EXTENSION cl_amd_printf : enable
#endif

#if defined(cl_amd_fp64)
#pragma OPENCL EXTENSION cl_amd_fp64 : enable
#endif

__kernel void clim2colFloat(const int n, global float* data_im, const int height, const int width, const int kernel_h, const int kernel_w, const int pad_h, const int pad_w, const int stride_h, const int stride_w, const int height_col, const int width_col, global float* data_col) {

	int idx = get_global_id(0);
	if ( idx < n ) {
		
		int w_out 		= idx % width_col;
		int h_idx 		= idx / width_col;
		int h_out 		= h_idx % height_col;
		int channel_in 	= h_idx / height_col;
		int channel_out = channel_in * kernel_h * kernel_w;
		int h_in 		= h_out * stride_h - pad_h;
		int w_in 		= w_out * stride_w - pad_w;
		
		global float* data_col_ptr  = data_col;
		data_col_ptr 			+= (channel_out * height_col + h_out) * width_col + w_out;

		global float* data_im_ptr 	= data_im;
		data_im_ptr 			+= (channel_in * height + h_in) * width + w_in;

		for (int i = 0; i < kernel_h; ++i) {
			int h = h_in + i;
			for (int j = 0; j < kernel_w; ++j) {
				int w = w_in + j;
				*data_col_ptr = (h >= 0 && w >= 0 && h < height && w < width) ? data_im_ptr[i * width + j] : 0;
				data_col_ptr += height_col*width_col;
			}
		}
	}
}

__kernel void clim2col_perfFloat(const int n, global float* data_im, const int bottom_step, const int num_channels, const int height, const int width, const int kernel_h, const int kernel_w, const int pad_h, const int pad_w, const int stride_h, const int stride_w, const int height_col, const int width_col, global float* data_col, const int top_step) {

	unsigned int gidx = get_global_id(0);
	if ( get_work_dim() == 3 ) {
		gidx = get_global_id(2)*get_global_size(0)*get_global_size(1) + get_global_id(1)*get_global_size(0) + get_global_id(0);
	}	

	if ( gidx < n ) {

		int image_idx	= gidx / (num_channels*height_col*width_col);
		int part_idx	= gidx % (num_channels*height_col*width_col);
		
		int w_out 		= part_idx % width_col;
		int h_idx 		= part_idx / width_col;
		int h_out 		= h_idx % height_col;
		int channel_in 	= h_idx / height_col;
		int channel_out = channel_in * kernel_h * kernel_w;
		int h_in 		= h_out * stride_h - pad_h;
		int w_in 		= w_out * stride_w - pad_w;
		
		global float* data_col_ptr  = data_col;
		data_col_ptr 			+= image_idx*top_step;
		data_col_ptr 			+= (channel_out * height_col + h_out) * width_col + w_out;
		
		global float* data_im_ptr 	= data_im;
		data_im_ptr 			+= image_idx*bottom_step;
		data_im_ptr 			+= (channel_in * height + h_in) * width + w_in;

		for (int i = 0; i < kernel_h; ++i) {
			int h = h_in + i;
			for (int j = 0; j < kernel_w; ++j) {
				int w = w_in + j;
				*data_col_ptr = (h >= 0 && w >= 0 && h < height && w < width) ? data_im_ptr[i * width + j] : 0;
				data_col_ptr += height_col*width_col;
			}
		}
	}
}

__kernel void clim2col_perf2Float(const int n, global float* data_im, const int data_im_step, const int height, const int width, const int kernel_h, const int kernel_w, const int pad_h, const int pad_w, const int stride_h, const int stride_w, const int height_col, const int width_col, global float* data_col, const int data_col_step) {

	int idx = get_global_id(0);
	if ( idx < n ) {
		
		int w_out 		= idx % width_col;
		int h_idx 		= idx / width_col;
		int h_out 		= h_idx % height_col;
		int channel_in 	= h_idx / height_col;
		int channel_out = channel_in * kernel_h * kernel_w;
		int h_in 		= h_out * stride_h - pad_h;
		int w_in 		= w_out * stride_w - pad_w;
		
		global float* data_col_ptr  = data_col;
		data_col_ptr			+= data_col_step;
		data_col_ptr 			+= (channel_out * height_col + h_out) * width_col + w_out;

		global float* data_im_ptr 	= data_im;
		data_im_ptr				+= data_im_step;
		data_im_ptr 			+= (channel_in * height + h_in) * width + w_in;

		for (int i = 0; i < kernel_h; ++i) {
			int h = h_in + i;
			for (int j = 0; j < kernel_w; ++j) {
				int w = w_in + j;
				*data_col_ptr = (h >= 0 && w >= 0 && h < height && w < width) ? data_im_ptr[i * width + j] : 0;
				data_col_ptr += height_col*width_col;
			}
		}
	}
}

__kernel void clcol2imFloat(const int n, global float* data_col, const int height, const int width, const int channels, const int patch_h, const int patch_w, const int pad_h, const int pad_w, const int stride_h, const int stride_w, const int height_col, const int width_col, global float* data_im) {

	int idx = get_global_id(0);
	if ( idx < n ) {

	 float val = 0;
		int w = idx % width + pad_w;
		int h = (idx / width) % height + pad_h;
		int c = idx / (width * height);

		// compute the start and end of the output
		int w_col_start = (w < patch_w) ? 0 : (w - patch_w) / stride_w + 1;
		int w_col_end = min(w / stride_w + 1, width_col);
		int h_col_start = (h < patch_h) ? 0 : (h - patch_h) / stride_h + 1;
		int h_col_end = min(h / stride_h + 1, height_col);

		int offset = (c * patch_h * patch_w + h * patch_w + w) * height_col * width_col;
		int coeff_h_col = (1 - stride_h * patch_w * height_col) * width_col;
		int coeff_w_col = (1 - stride_w * height_col * width_col);
		for (int h_col = h_col_start; h_col < h_col_end; ++h_col) {
		  for (int w_col = w_col_start; w_col < w_col_end; ++w_col) {
			val += data_col[offset + h_col * coeff_h_col + w_col * coeff_w_col];
		  }
		}
		data_im[idx] = val;
	}
}

__kernel void clcol2im_perf2Float(const int n, global float* data_col, const int data_col_step, const int height, const int width, const int channels, const int patch_h, const int patch_w, const int pad_h, const int pad_w, const int stride_h, const int stride_w, const int height_col, const int width_col, global float* data_im, const int data_im_step) {

	int idx = get_global_id(0);
	if ( idx < n ) {

		global float* data_col_ptr  = data_col;
		data_col_ptr 			+= data_col_step;

		global float* data_im_ptr 	= data_im;
		data_im_ptr 			+= data_im_step;

	 float val = 0;
		int w = idx % width + pad_w;
		int h = (idx / width) % height + pad_h;
		int c = idx / (width * height);

		// compute the start and end of the output
		int w_col_start = (w < patch_w) ? 0 : (w - patch_w) / stride_w + 1;
		int w_col_end = min(w / stride_w + 1, width_col);
		int h_col_start = (h < patch_h) ? 0 : (h - patch_h) / stride_h + 1;
		int h_col_end = min(h / stride_h + 1, height_col);

		int offset = (c * patch_h * patch_w + h * patch_w + w) * height_col * width_col;
		int coeff_h_col = (1 - stride_h * patch_w * height_col) * width_col;
		int coeff_w_col = (1 - stride_w * height_col * width_col);
		for (int h_col = h_col_start; h_col < h_col_end; ++h_col) {
		  for (int w_col = w_col_start; w_col < w_col_end; ++w_col) {
			val += data_col_ptr[offset + h_col * coeff_h_col + w_col * coeff_w_col];
		  }
		}
		data_im_ptr[idx] = val;
	}
}


__kernel void clcol2im_perfFloat(const int n, global float* data_col, const int top_step, const int col_number, const int height, const int width, const int channels, const int patch_h, const int patch_w, const int pad_h, const int pad_w, const int stride_h, const int stride_w, const int height_col, const int width_col, global float* data_im, const int bottom_step) {

	int idx = get_global_id(0);
	if ( idx < n ) {

		int col_idx		= idx / (channels*height*width);
		int part_idx	= idx % (channels*height*width);

		global float* data_col_ptr  = data_col;
		data_col_ptr 			+= col_idx*top_step;

		global float* data_im_ptr 	= data_im;
		data_im_ptr 			+= col_idx*bottom_step;

	 float val = 0;
		int w = part_idx % width + pad_w;
		int h = (part_idx / width) % height + pad_h;
		int c = part_idx / (width * height);

		// compute the start and end of the output
		int w_col_start = (w < patch_w) ? 0 : (w - patch_w) / stride_w + 1;
		int w_col_end = min(w / stride_w + 1, width_col);
		int h_col_start = (h < patch_h) ? 0 : (h - patch_h) / stride_h + 1;
		int h_col_end = min(h / stride_h + 1, height_col);

		int offset = (c * patch_h * patch_w + h * patch_w + w) * height_col * width_col;
		int coeff_h_col = (1 - stride_h * patch_w * height_col) * width_col;
		int coeff_w_col = (1 - stride_w * height_col * width_col);
		for (int h_col = h_col_start; h_col < h_col_end; ++h_col) {
		  for (int w_col = w_col_start; w_col < w_col_end; ++w_col) {
			val += data_col_ptr[offset + h_col * coeff_h_col + w_col * coeff_w_col];
		  }
		}
		data_im_ptr[part_idx] = val;
	}
}
