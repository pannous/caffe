// This file was auto-generated from file 'src/caffe/util/OpenCL/math_functions.cl' to conform to standard OpenCL
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

#if defined(cl_nv_pragma_unroll)
#pragma OPENCL EXTENSION cl_nv_pragma_unroll : enable
#define NV_PLATFORM
#endif

#define OPENCL_LOCAL_SIZE 32
#define BLOCK_SIZE 32

__kernel void clsignFloat(const int n, global float* x, global float* y) {

	int idx = get_global_id(0);
	if ( idx < n ) {
		y[idx] = sign((float)x[idx]);
	}
}
__kernel void clsignDouble(const int n, global float* x, global float* y) {

	int idx = get_global_id(0);
	if ( idx < n ) {
		y[idx] = sign((float)x[idx]);
	}
}

__kernel void clsgnbitFloat(const int n, global float* x, global float* y) {

	int idx = get_global_id(0);
	if ( idx < n ) {
		y[idx] = signbit((float)x[idx]);
	}
}
__kernel void clsgnbitDouble(const int n, global float* x, global float* y) {

	int idx = get_global_id(0);
	if ( idx < n ) {
		y[idx] = signbit((float)x[idx]);
	}
}

__kernel void clabsFloat(const int n, global float* x, global float* y) {

	int idx = get_global_id(0);
	if ( idx < n ) {
		y[idx] = fabs((float)x[idx]);
	}
}
__kernel void clabsDouble(const int n, global float* x, global float* y) {

	int idx = get_global_id(0);
	if ( idx < n ) {
		y[idx] = fabs((float)x[idx]);
	}
}

__kernel void cldivFloat(const int n, global float* x, global float* y, global float* z) {

	int idx = get_global_id(0);
	if ( idx < n ) {
		z[idx] = x[idx] / y[idx];
	}
}
__kernel void cldivDouble(const int n, global float* x, global float* y, global float* z) {

	int idx = get_global_id(0);
	if ( idx < n ) {
		z[idx] = x[idx] / y[idx];
	}
}

__kernel void clmulFloat(const int n, global float* x, global float* y, global float* z) {

	int idx = get_global_id(0);
	if ( idx < n ) {
		z[idx] = x[idx] * y[idx];
	}
}
__kernel void clmulDouble(const int n, global float* x, global float* y, global float* z) {

	int idx = get_global_id(0);
	if ( idx < n ) {
		z[idx] = x[idx] * y[idx];
	}
}

__kernel void clFillBufferChar(const int n, const char alpha, global char* x) {

	int idx = get_global_id(0);
	if ( idx < n ) {
		x[idx] = alpha;
	}
}
__kernel void clFillBufferInt(const int n, const int alpha, global int* x) {

	int idx = get_global_id(0);
	if ( idx < n ) {
		x[idx] = alpha;
	}
}
__kernel void clFillBufferFloat(const int n, const float alpha, global float* x) {

	int idx = get_global_id(0);
	if ( idx < n ) {
		x[idx] = alpha;
	}
}
__kernel void clFillBufferDouble(const int n, const float alpha, global float* x) {

	int idx = get_global_id(0);
	if ( idx < n ) {
		x[idx] = alpha;
	}
}

__kernel void clGPU2GPUChar(const int n, global char* x, const int offset_x, global char* y, const int offset_y) {

	int idx = get_local_id(0);
	int localSize = get_local_size(0);
	for(int i = 0; i < n; i += localSize ) {
		y[idx+offset_y+n-1-i-idx] = x[idx+offset_x+n-1-i-idx];
	}
}
__kernel void clGPU2GPUInt(const int n, global int* x, const int offset_x, global int* y, const int offset_y) {

	int idx = get_local_id(0);
	int localSize = get_local_size(0);
	for(int i = 0; i < n; i += localSize ) {
		y[idx+offset_y+n-1-i-idx] = x[idx+offset_x+n-1-i-idx];
	}
}
__kernel void clGPU2GPUFloat(const int n, global float* x, const int offset_x, global float* y, const int offset_y) {

	int idx = get_local_id(0);
	int localSize = get_local_size(0);
	for(int i = 0; i < n; i += localSize ) {
		y[idx+offset_y+n-1-i-idx] = x[idx+offset_x+n-1-i-idx];
	}
}
__kernel void clGPU2GPUDouble(const int n, global float* x, const int offset_x, global float* y, const int offset_y) {

	int idx = get_local_id(0);
	int localSize = get_local_size(0);
	for(int i = 0; i < n; i += localSize ) {
		y[idx+offset_y+n-1-i-idx] = x[idx+offset_x+n-1-i-idx];
	}
}

__kernel void clsubFloat(const int n, global float* x, global float* y, global float* z) {

	int idx = get_global_id(0);
	if ( idx < n ) {
		z[idx] = x[idx] - y[idx];
	}
}
__kernel void clsubDouble(const int n, global float* x, global float* y, global float* z) {

	int idx = get_global_id(0);
	if ( idx < n ) {
		z[idx] = x[idx] - y[idx];
	}
}

__kernel void claddFloat(const int n, global float* x, global float* y, global float* z) {

	int idx = get_global_id(0);
	if ( idx < n ) {
		z[idx] = x[idx] + y[idx];
	}
}
__kernel void claddDouble(const int n, global float* x, global float* y, global float* z) {

	int idx = get_global_id(0);
	if ( idx < n ) {
		z[idx] = x[idx] + y[idx];
	}
}

__kernel void cladd_scalarFloat(const int N, const float alpha, global float* Y) {

	int idx = get_global_id(0);
	if ( idx < N ) {
	    Y[idx] += alpha;
	}
}
__kernel void cladd_scalarDouble(const int N, const float alpha, global float* Y) {

	int idx = get_global_id(0);
	if ( idx < N ) {
	    Y[idx] += alpha;
	}
}

__kernel void clpowxFloat(const int n, global float* x, float alpha, global float* z) {

	int idx = get_global_id(0);
	if ( idx < n ) {
		// z[idx] = pow(((float)x[idx],alpha); original
		//z[idx] = pow((float), (float) alpha); // NV fix

		if ( alpha == 2.0 ) {
			z[idx] = pow((float) fabs((float)x[idx]), (float) alpha); // MVN fix, ContrastiveLossLayerTest, AdaGradSolverTest
		} else {
			z[idx] = pow((float) x[idx], (float) alpha); // MVN fix, ContrastiveLossLayerTest, AdaGradSolverTest
		}
		//printf("z[%d] = %f <> pow(%f, %f)\n", idx, z[idx], x[idx], alpha);
	}
}
__kernel void clpowxDouble(const int n, global float* x, float alpha, global float* z) {

	int idx = get_global_id(0);
	if ( idx < n ) {
		// z[idx] = pow(((float)x[idx],alpha); original
		//z[idx] = pow((float), (float) alpha); // NV fix

		if ( alpha == 2.0 ) {
			z[idx] = pow((float) fabs((float)x[idx]), (float) alpha); // MVN fix, ContrastiveLossLayerTest, AdaGradSolverTest
		} else {
			z[idx] = pow((float) x[idx], (float) alpha); // MVN fix, ContrastiveLossLayerTest, AdaGradSolverTest
		}
		//printf("z[%d] = %f <> pow(%f, %f)\n", idx, z[idx], x[idx], alpha);
	}
}

__kernel void clexpFloat(const int n, global float* x, global float* y) {

	int idx = get_global_id(0);
	if ( idx < n ) {
		y[idx] = exp((float)x[idx]);
	}
}
__kernel void clexpDouble(const int n, global float* x, global float* y) {

	int idx = get_global_id(0);
	if ( idx < n ) {
		y[idx] = exp((float)x[idx]);
	}
}

/* Source: OpenCL Programming Guide by authors Munshi, Gaster, Mattson, Fung, Ginsburg
 * Ch 21 Matrix Multiplication with OpenCL
 */
__kernel void mmulFloat(const int M, const int N, const int K, const float alpha, global float* A, global float* B, const float beta, global float* C,  local float* rowBufferA,  local float* colBufferA) {

#if defined(NV_PLATFORM)
  local float colBufferB[OPENCL_LOCAL_SIZE];
#else
  local float colBufferB[OPENCL_LOCAL_SIZE];
#endif
  
  int colBufferSteps = 0;
  if ( K % OPENCL_LOCAL_SIZE == 0 ) {
    colBufferSteps    = K / OPENCL_LOCAL_SIZE;
  } else {
    colBufferSteps    = K / OPENCL_LOCAL_SIZE + 1;    
  }

  float tmp;
  int idx_n = get_global_id(0);
    
  for( int s = 0; s < colBufferSteps; s++ ) {

    int idx_k = s*OPENCL_LOCAL_SIZE + get_local_id(1);
    if ( idx_k < K ) {
      colBufferB[get_local_id(1)] = B[idx_k*N+idx_n];
    }
    barrier(CLK_LOCAL_MEM_FENCE);
    
    for(int idx_m = 0; idx_m < M; idx_m++ )  {

      int idx_k = s*OPENCL_LOCAL_SIZE + get_local_id(1);
      if ( idx_k < K ) {
        rowBufferA[idx_k] = A[idx_m*K+idx_k];
      }
      barrier(CLK_LOCAL_MEM_FENCE);
      
      if ( get_local_id(1) == 0 ) {
        if ( s == 0 ) {
          colBufferA[idx_m] = 0.0;
        }
        tmp = 0.0;
        for( int k = 0; k < OPENCL_LOCAL_SIZE && k < K; k++ ) {
          int idx_k = s*OPENCL_LOCAL_SIZE + k;
          if ( idx_k < K ) {
            //tmp += alpha*A[idx_m*K+idx_k]*B[idx_k*N+idx_n];       // direct
            //tmp += alpha*rowBufferA[idx_k]*B[idx_k*N+idx_n];      // with rowBufferA
            //tmp += alpha*A[idx_m*K+idx_k]*colBufferB[k];          // with colBufferB
            tmp += alpha*rowBufferA[idx_k]*colBufferB[k];     // with rowBufferA & colBufferB
          }
        }
        colBufferA[idx_m] += tmp;
        
        if ( s == colBufferSteps - 1 ) {
          C[idx_m*N+idx_n] = colBufferA[idx_m];     
        }
      }
    }
  }
  
}
__kernel void mmulDouble(const int M, const int N, const int K, const float alpha, global float* A, global float* B, const float beta, global float* C,  local float* rowBufferA,  local float* colBufferA) {

#if defined(NV_PLATFORM)
  local float colBufferB[OPENCL_LOCAL_SIZE];
#else
  local float colBufferB[OPENCL_LOCAL_SIZE];
#endif
  
  int colBufferSteps = 0;
  if ( K % OPENCL_LOCAL_SIZE == 0 ) {
    colBufferSteps    = K / OPENCL_LOCAL_SIZE;
  } else {
    colBufferSteps    = K / OPENCL_LOCAL_SIZE + 1;    
  }

  float tmp;
  int idx_n = get_global_id(0);
    
  for( int s = 0; s < colBufferSteps; s++ ) {

    int idx_k = s*OPENCL_LOCAL_SIZE + get_local_id(1);
    if ( idx_k < K ) {
      colBufferB[get_local_id(1)] = B[idx_k*N+idx_n];
    }
    barrier(CLK_LOCAL_MEM_FENCE);
    
    for(int idx_m = 0; idx_m < M; idx_m++ )  {

      int idx_k = s*OPENCL_LOCAL_SIZE + get_local_id(1);
      if ( idx_k < K ) {
        rowBufferA[idx_k] = A[idx_m*K+idx_k];
      }
      barrier(CLK_LOCAL_MEM_FENCE);
      
      if ( get_local_id(1) == 0 ) {
        if ( s == 0 ) {
          colBufferA[idx_m] = 0.0;
        }
        tmp = 0.0;
        for( int k = 0; k < OPENCL_LOCAL_SIZE && k < K; k++ ) {
          int idx_k = s*OPENCL_LOCAL_SIZE + k;
          if ( idx_k < K ) {
            //tmp += alpha*A[idx_m*K+idx_k]*B[idx_k*N+idx_n];       // direct
            //tmp += alpha*rowBufferA[idx_k]*B[idx_k*N+idx_n];      // with rowBufferA
            //tmp += alpha*A[idx_m*K+idx_k]*colBufferB[k];          // with colBufferB
            tmp += alpha*rowBufferA[idx_k]*colBufferB[k];     // with rowBufferA & colBufferB
          }
        }
        colBufferA[idx_m] += tmp;
        
        if ( s == colBufferSteps - 1 ) {
          C[idx_m*N+idx_n] = colBufferA[idx_m];     
        }
      }
    }
  }
  
}


__kernel void mmul2Float(const int M, const int N, const int K, const float alpha, global float* A, global float* B, const float beta, global float* C,  local float* rowBufferA,  local float* colBufferA) {

  // Block index
    int bx = get_group_id(0);
    int by = get_group_id(1);
 
    // Thread index
    int tx = get_local_id(0);
    int ty = get_local_id(1);
    
      // Index of the first sub-matrix of A processed 
      // by the block
      int aBegin = K * BLOCK_SIZE * by;
   
      // Index of the last sub-matrix of A processed 
      // by the block
      int aEnd   = aBegin + K - 1;
   
      // Step size used to iterate through the 
      // sub-matrices of A
      int aStep  = BLOCK_SIZE;
   
      // Index of the first sub-matrix of B processed 
      // by the block
      int bBegin = BLOCK_SIZE * bx;
   
      // Step size used to iterate through the 
      // sub-matrices of B
      int bStep  = BLOCK_SIZE * N;
      
      float Csub = 0.0;
   
      // Loop over all the sub-matrices of A and B
      // required to compute the block sub-matrix
      for (int a = aBegin, b = bBegin;
               a <= aEnd;
               a += aStep, b += bStep) 
      {
  
          // Declaration of the local memory array As 
          // used to store the sub-matrix of A
          __local float As[BLOCK_SIZE][BLOCK_SIZE];
   
          // Declaration of the local memory array Bs 
          // used to store the sub-matrix of B
          __local float Bs[BLOCK_SIZE][BLOCK_SIZE];
   
          // Load the matrices from global memory
          // to local memory; each thread loads
          // one element of each matrix
          if ( a + K * ty + tx < M*K ) {
            As[ty][tx] = A[a + K * ty + tx];
          }
          //else {
          //  As[ty][tx] = 0.0;
          //}
          if (b + N * ty + tx < K*N ) {
            Bs[ty][tx] = B[b + N * ty + tx];
          } 
          //else {
          //  Bs[ty][tx] = 0.0;
          //}
   
          // Synchronize to make sure the matrices 
          // are loaded
          barrier(CLK_LOCAL_MEM_FENCE);
   
          // Multiply the two matrices together;
          // each thread computes one element
          // of the block sub-matrix
          int limit = BLOCK_SIZE;
          
          if ( K % BLOCK_SIZE != 0 && a == aEnd ) {
            limit = K/BLOCK_SIZE;
          }
          
          if ( K < BLOCK_SIZE ) {
            limit = K;
          }
          
          for (int k = 0; k < limit; ++k) {
            Csub += As[ty][k] * Bs[k][tx];
          }
   
          // Synchronize to make sure that the preceding
          // computation is done before loading two new
          // sub-matrices of A and B in the next iteration
          barrier(CLK_LOCAL_MEM_FENCE);   
      }
   
      // Write the block sub-matrix to device memory;
      // each thread writes one element
      if ( get_global_id(0) < N && get_global_id(1) < M ) {
        int c = N * BLOCK_SIZE * by + BLOCK_SIZE * bx;
        if (c + N * ty + tx < M*N ) {
          C[c + N * ty + tx] = Csub;
        }
      }
}
__kernel void mmul2Double(const int M, const int N, const int K, const float alpha, global float* A, global float* B, const float beta, global float* C,  local float* rowBufferA,  local float* colBufferA) {

  // Block index
    int bx = get_group_id(0);
    int by = get_group_id(1);
 
    // Thread index
    int tx = get_local_id(0);
    int ty = get_local_id(1);
    
      // Index of the first sub-matrix of A processed 
      // by the block
      int aBegin = K * BLOCK_SIZE * by;
   
      // Index of the last sub-matrix of A processed 
      // by the block
      int aEnd   = aBegin + K - 1;
   
      // Step size used to iterate through the 
      // sub-matrices of A
      int aStep  = BLOCK_SIZE;
   
      // Index of the first sub-matrix of B processed 
      // by the block
      int bBegin = BLOCK_SIZE * bx;
   
      // Step size used to iterate through the 
      // sub-matrices of B
      int bStep  = BLOCK_SIZE * N;
      
      float Csub = 0.0;
   
      // Loop over all the sub-matrices of A and B
      // required to compute the block sub-matrix
      for (int a = aBegin, b = bBegin;
               a <= aEnd;
               a += aStep, b += bStep) 
      {
  
          // Declaration of the local memory array As 
          // used to store the sub-matrix of A
          __local float As[BLOCK_SIZE][BLOCK_SIZE];
   
          // Declaration of the local memory array Bs 
          // used to store the sub-matrix of B
          __local float Bs[BLOCK_SIZE][BLOCK_SIZE];
   
          // Load the matrices from global memory
          // to local memory; each thread loads
          // one element of each matrix
          if ( a + K * ty + tx < M*K ) {
            As[ty][tx] = A[a + K * ty + tx];
          }
          //else {
          //  As[ty][tx] = 0.0;
          //}
          if (b + N * ty + tx < K*N ) {
            Bs[ty][tx] = B[b + N * ty + tx];
          } 
          //else {
          //  Bs[ty][tx] = 0.0;
          //}
   
          // Synchronize to make sure the matrices 
          // are loaded
          barrier(CLK_LOCAL_MEM_FENCE);
   
          // Multiply the two matrices together;
          // each thread computes one element
          // of the block sub-matrix
          int limit = BLOCK_SIZE;
          
          if ( K % BLOCK_SIZE != 0 && a == aEnd ) {
            limit = K/BLOCK_SIZE;
          }
          
          if ( K < BLOCK_SIZE ) {
            limit = K;
          }
          
          for (int k = 0; k < limit; ++k) {
            Csub += As[ty][k] * Bs[k][tx];
          }
   
          // Synchronize to make sure that the preceding
          // computation is done before loading two new
          // sub-matrices of A and B in the next iteration
          barrier(CLK_LOCAL_MEM_FENCE);   
      }
   
      // Write the block sub-matrix to device memory;
      // each thread writes one element
      if ( get_global_id(0) < N && get_global_id(1) < M ) {
        int c = N * BLOCK_SIZE * by + BLOCK_SIZE * bx;
        if (c + N * ty + tx < M*N ) {
          C[c + N * ty + tx] = Csub;
        }
      }
}
