// This file was auto-generated from file 'src/caffe/layers/OpenCL/mvn_layer.cl' to conform to standard OpenCL

__kernel void MVNLayerForwardResidualFloat(global float* bottom_data, const int bottom_data_height, const int bottom_data_width,	global float* sum_multiplier, const int sum_multiplier_width,	global float* mean, const int mean_width,	global float* variance, const int variance_width,	const float eps, global float* top_data, const int top_data_height, const int top_data_width) {

	if ( get_work_dim() == 1 ) {
		int idx = get_global_id(0);
		int idx_h = idx / bottom_data_width;
		int idx_w = idx % bottom_data_width;
		
	 float divident = (bottom_data[idx] - mean[idx_h]*sum_multiplier[idx_w]);
	 float divisor  = (sqrt((float)variance[idx_h] - mean[idx_h]*mean[idx_h]) + eps)*sum_multiplier[idx_w];
		top_data[idx] = divident/divisor;
	}
	
	if ( get_work_dim() == 2 ) {
		int idx_h = get_global_id(0);
		int idx_w = get_global_id(1);
	
		while( idx_w < bottom_data_width ) {
			int idx   = bottom_data_width*idx_h + idx_w;
		 float divident = (bottom_data[idx] - mean[idx_h]*sum_multiplier[idx_w]);
		 float divisor  = (sqrt((float)variance[idx_h] - mean[idx_h]*mean[idx_h]) + eps)*sum_multiplier[idx_w];
			top_data[idx] = divident/divisor;
			idx_w += get_global_size(1);
		}
	}
}

__kernel void MVNLayerForwardMV2Float(global float* data2D, const int data2D_height, const int data2D_width, global float* data1D, const int data1D_length, global float* linear_term, global float* quadratic_term) {

	int idx = get_global_id(0);

	global float* data2D_ptr = data2D;
	data2D_ptr += idx*data2D_width;
		
 float linear_sum	= 0;
 float quadratic_sum	= 0;
				
	for(int j = 0; j < data2D_width; j++ ) {
	   	linear_sum 		+= data2D_ptr[j]*data1D[j];
	   	quadratic_sum 	+= data2D_ptr[j]*data2D_ptr[j]*data1D[j];
	}
	
	linear_term[idx] 	= linear_sum/data2D_width;
	quadratic_term[idx] = quadratic_sum/data2D_width;
}

__kernel void MVNLayerForwardFloat(global float* data2D_in, const int data2D_in_height, const int data2D_in_width, global float* data1D_in, const int data1D_in_length, global float* linear_term, const int linear_term_length, global float* quadratic_term, const int quadratic_term_length, const float eps, global float* data2D_out) {

	int idx = get_global_id(0);
	
	int idx_h = idx / data2D_in_width;
	int idx_w = idx % data2D_in_width;
	
	global float* data2D_in_ptr = data2D_in;
	data2D_in_ptr += idx;
	
	global float* data1D_in_ptr = data1D_in;
	data1D_in_ptr += idx_w;
	
	global float* linear_term_ptr = linear_term;
	linear_term_ptr += idx_h;

	global float* quadratic_term_ptr = quadratic_term;
	quadratic_term_ptr += idx_h;

	global float* data2D_out_ptr = data2D_out;
	data2D_out_ptr += idx;
	
 float divident = (data2D_in_ptr[0] - linear_term_ptr[0]*data1D_in_ptr[0]);
 float quotient = (sqrt((float)quadratic_term_ptr[0] - linear_term_ptr[0]*linear_term_ptr[0]) + eps)*data1D_in_ptr[0];
	
	data2D_out_ptr[0] = divident/quotient;

}

__kernel void MVNLayerForwardS2Float(global float* data2D_in, const int data2D_in_height, const int data2D_in_width, global float* data1D_in, const int data1D_in_length, global float* data2D_out) {

	int idx = get_global_id(0);
	
	int idx_h = idx / data2D_in_width;
	int idx_w = idx % data2D_in_width;
	
	global float* data2D_in_ptr = data2D_in;
	data2D_in_ptr += idx;
	
	global float* data1D_in_ptr = data1D_in;
	data1D_in_ptr += idx_w;
	
	global float* data2D_out_ptr = data2D_out;
	data2D_out_ptr += idx;
	
 float val = 0;
	for(int j = 0; j < data2D_in_width; j++) {
		val += data2D_in[idx_h*data2D_in_width+j]*data1D_in[j];
	}
	val /= data2D_in_width;
	
	data2D_out_ptr[0] = data2D_in_ptr[0] - val*data1D_in_ptr[0];

}



__kernel void MVNLayerBackwardMV2Float(global float* data2D, global float* diff2D, const int data2D_height, const int data2D_width, global float* data1D, const int data1D_length, global float* linear_term, global float* quadratic_term) {

	int idx = get_global_id(0);

	global float* data2D_ptr = data2D;
	data2D_ptr += idx*data2D_width;

	global float* diff2D_ptr = diff2D;
	diff2D_ptr += idx*data2D_width;

 float linear_sum	= 0;
 float quadratic_sum	= 0;
				
	for(int j = 0; j < data2D_width; j++ ) {
	   	linear_sum 		+= diff2D_ptr[j]*data1D[j];
	   	quadratic_sum 	+= data2D_ptr[j]*diff2D_ptr[j]*data1D[j];
	}
	
	linear_term[idx] 	= linear_sum;
	quadratic_term[idx] = quadratic_sum;
}

__kernel void MVNLayerBackwardS1Float(global float* data2D, global float* diff2D, const int data2D_height, const int data2D_width, global float* data1D, const int data1D_length, global float* linear_term, const int linear_term_length, global float* quadratic_term, const int quadratic_term_length, global float* data2D_out) {

	int idx = get_global_id(0);

	int idx_h = idx / data2D_width;
	int idx_w = idx % data2D_width;

	global float* data2D_ptr = data2D;
	data2D_ptr += idx;

	global float* diff2D_ptr = diff2D;
	diff2D_ptr += idx;

	global float* data1D_ptr = data1D;
	data1D_ptr += idx_w;

	global float* linear_term_ptr = linear_term;
	linear_term_ptr += idx_h;

	global float* quadratic_term_ptr = quadratic_term;
	quadratic_term_ptr += idx_h;

	global float* data2D_out_ptr = data2D_out;
	data2D_out_ptr += idx;
	
	data2D_out_ptr[0] = diff2D_ptr[0] - 1.0/data2D_width * data1D_ptr[0] * ( linear_term_ptr[0] + quadratic_term_ptr[0]*data2D_ptr[0] ); 
}

__kernel void MVNLayerBackwardFloat(global float* data2D_in, const int data2D_in_height, const int data2D_in_width, global float* data1D_in, const int data1D_in_length, global float* linear_term, const int linear_term_length, global float* quadratic_term, const int quadratic_term_length, const float eps, global float* data2D_out) {

	int idx = get_global_id(0);
	
	int idx_h = idx / data2D_in_width;
	int idx_w = idx % data2D_in_width;
	
	global float* data2D_in_ptr = data2D_in;
	data2D_in_ptr += idx;
	
	global float* data1D_in_ptr = data1D_in;
	data1D_in_ptr += idx_w;
	
	global float* linear_term_ptr = linear_term;
	linear_term_ptr += idx_h;

	global float* quadratic_term_ptr = quadratic_term;
	quadratic_term_ptr += idx_h;

	global float* data2D_out_ptr = data2D_out;
	data2D_out_ptr += idx;
	
 float divident = data2D_in_ptr[0];
 float quotient = (sqrt((float)quadratic_term_ptr[0] - linear_term_ptr[0]*linear_term_ptr[0]) + eps)*data1D_in_ptr[0];
	
	data2D_out_ptr[0] = divident/quotient;

}

//	caffe::OpenCL::clMVNLayerForwardMV2(bottom_data, num, dim, sum_multiplier_.gpu_data(), dim, (Dtype*) mean_.mutable_gpu_data(), (Dtype*) variance_.mutable_gpu_data());
//	caffe::OpenCL::clMVNLayerForward(bottom_data, num, dim, sum_multiplier_.gpu_data(), dim, (Dtype*) mean_.mutable_gpu_data(), num, (Dtype*) variance_.mutable_gpu_data(), num, eps, top_data);

__kernel void MVNLayerForward_perfFloat(global float* A2D_top, global float* A2D_top_diff, const int top_height, const int top_width, global float* A2D_bottom, global float* A2D_bottom_diff, const int bottom_height, const int bottom_width, global float* A1D_sum_multiplier, global float* A1D_buffer, const int sum_multiplier_length, const float eps, global float* A2D_out) {

	int idx = get_global_id(0);
	
	int idx_h = idx / top_width;
	int idx_w = idx % top_width;
	
	global float* _A2D_top = A2D_top;
	_A2D_top += idx;

	global float* _A2D_top_diff = A2D_top_diff;
	_A2D_top_diff += idx;

	global float* _A2D_bottom = A2D_bottom;
	_A2D_bottom += idx;

	global float* _A2D_bottom_diff = A2D_bottom_diff;
	_A2D_bottom_diff += idx;

	global float* _A1D_sum_multiplier = A1D_sum_multiplier;
	_A1D_sum_multiplier += idx_w;

	global float* _A1D_buffer = A1D_buffer;
	_A1D_buffer += idx_w;

	global float* _A2D_out = A2D_out;
	_A2D_out += idx;

 float sum1 	= 0.0;
 float sum2 	= 0.0;
		
	sum1 = 0.0;
	for( int i = 0; i < bottom_width; i++ ) {
		sum1 += A2D_bottom[idx_h*bottom_width+i]*A1D_sum_multiplier[i];
	}
	sum1 /= bottom_width;

	sum2 = 0.0;
	for( int i = 0; i < bottom_width; i++ ) {
		sum2 += A2D_bottom[idx_h*bottom_width+i]*A2D_bottom[idx_h*bottom_width+i]*A1D_sum_multiplier[i];
	}
	sum2 /= bottom_width;

 float divident = (_A2D_bottom[0] - sum1*_A1D_sum_multiplier[0]);
 float quotient = (sqrt((float)sum2 - sum1*sum1) + eps)*_A1D_sum_multiplier[0];
	
	_A2D_out[0] = divident/quotient;
}


__kernel void MVNLayerBackward_perfFloat(global float* A2D_top, global float* A2D_top_diff, const int top_height, const int top_width, global float* A2D_bottom, global float* A2D_bottom_diff, const int bottom_height, const int bottom_width, global float* A1D_sum_multiplier, global float* A1D_buffer, const int sum_multiplier_length, const float eps, global float* A2D_out) {

	int idx = get_global_id(0);
	
	int idx_h = idx / top_width;
	int idx_w = idx % top_width;
	
	global float* _A2D_top = A2D_top;
	_A2D_top += idx;

	global float* _A2D_top_diff = A2D_top_diff;
	_A2D_top_diff += idx;

	global float* _A2D_bottom = A2D_bottom;
	_A2D_bottom += idx;

	global float* _A2D_bottom_diff = A2D_bottom_diff;
	_A2D_bottom_diff += idx;

	global float* _A1D_sum_multiplier = A1D_sum_multiplier;
	_A1D_sum_multiplier += idx_w;

	global float* _A1D_buffer = A1D_buffer;
	_A1D_buffer += idx_w;

	global float* _A2D_out = A2D_out;
	_A2D_out += idx;

 float sum1 	= 0.0;
 float sum2 	= 0.0;
 float sum3 	= 0.0;
 float sum4 	= 0.0;
 float value = 0.0;
		
	sum1 = 0.0;
	for( int i = 0; i < top_width; i++ ) {
		sum1 += A2D_top_diff[idx_h*top_width+i]*A1D_sum_multiplier[i];
	}

	sum2 = 0.0;
	for( int i = 0; i < top_width; i++ ) {
		sum2 += A2D_top[idx_h*top_width+i]*A2D_top_diff[idx_h*top_width+i]*A1D_sum_multiplier[i];
	}
	
 float S1 = _A2D_top_diff[0] - 1.0/top_width * A1D_sum_multiplier[idx_w] * ( sum1 + sum2*_A2D_top[0] ); 
		
	sum3 = 0.0;
	for( int i = 0; i < top_width; i++ ) {
		sum3 += A2D_bottom[idx_h*top_width+i]*A1D_sum_multiplier[i];
	}
	sum3 /= top_width;

	sum4 = 0.0;
	for( int i = 0; i < top_width; i++ ) {
		sum4 += A2D_bottom[idx_h*top_width+i]*A2D_bottom[idx_h*top_width+i]*A1D_sum_multiplier[i];
	}
	sum4 /= top_width;
	
 float divident = S1;
 float quotient = (sqrt((float)sum4 - sum3*sum3) + eps)*A1D_sum_multiplier[idx_w];
	
	_A2D_out[0] = divident/quotient;
}

