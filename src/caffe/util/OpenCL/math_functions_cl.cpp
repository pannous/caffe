#ifdef USE_OPENCL

#include <cmath>
#include <cstdlib>
#include <cstring>

#include "caffe/common.hpp"
#include "caffe/util/math_functions.hpp"
#include "caffe/util/OpenCL/OpenCLSupport.hpp"
#include "cblas.h"

namespace caffe {

void caffe_gpu_memcpy(const size_t N, const void* X, void* Y, int type) {

	if (X != Y) {
		BOOL_CHECK(caffe::OpenCL::clMemcpy(Y, X, N, type));  // NOLINT(caffe/alt_fn)
	}
}

void caffe_gpu_memcpy(const size_t N, const void* X, void* Y) {

	if (X != Y) {
		BOOL_CHECK(caffe::OpenCL::clMemcpy(Y, X, N, caffe::OpenCL::COPY_DEFAULT));  // NOLINT(caffe/alt_fn)
	}
}

template<typename T>
void caffe_gpu_memset(const size_t Bytes, const T alpha, void* X) {
	try {
		caffe::OpenCL::clMemset(X, alpha, Bytes);
	} catch (std::exception &e) {
		LOG(ERROR)<<e.what();
	}
}
template void caffe_gpu_memset<char>(const size_t Bytes, const char alpha, void* X);
template void caffe_gpu_memset<int>(const size_t Bytes, const int alpha, void* X);
template void caffe_gpu_memset<float>(const size_t Bytes, const float alpha, void* X);

template<typename T>
void caffe_gpu_asum(const int n, const T* x, T* y) {
	BOOL_CHECK(caffe::OpenCL::clBLASasum<T>(n, x, y));
}
template void caffe_gpu_asum<float>(const int n, const float* x, float* y);

template<typename T>
void caffe_gpu_sign(const int n, const T* x, T* y) {
	BOOL_CHECK(caffe::OpenCL::clsign<T>(n, x, y));
}
template void caffe_gpu_sign<float>(const int n, const float* x, float* y);

template<typename T>
void caffe_gpu_sgnbit(const int n, const T* x, T* y) {
	BOOL_CHECK(caffe::OpenCL::clsgnbit<T>(n, x, y));
}
template void caffe_gpu_sgnbit<float>(const int n, const float* x, float* y);

template<typename T>
void caffe_gpu_abs(const int n, const T* x, T* y) {
	BOOL_CHECK(caffe::OpenCL::clabs<T>(n, x, y));
}
template void caffe_gpu_abs<float>(const int n, const float* x, float* y);

template<typename T>
void caffe_gpu_div(const int n, const T* x, const T* y, T* z) {
	BOOL_CHECK(caffe::OpenCL::cldiv<T>(n, x, y, z));
}
template void caffe_gpu_div<float>(const int n, const float* x, const float* y, float* z);

template<typename T>
void caffe_gpu_mul(const int n, const T* x, const T* y, T* z) {
	BOOL_CHECK(caffe::OpenCL::clmul<T>(n, x, y, z));
}
template void caffe_gpu_mul<float>(const int n, const float* x, const float* y, float* z);

template<typename T>
void caffe_gpu_scale(const int n, const float alpha, const T* x, T* y) {
	BOOL_CHECK(caffe::OpenCL::clBLASscal<T>(n, alpha, x, y));
}
template void caffe_gpu_scale<float>(const int n, const float alpha, const float* x, float* y);

template<typename T>
void caffe_gpu_set(const int N, const T alpha, T* Y) {

	try {
		caffe::OpenCL::clMemset(Y, alpha, sizeof(T) * N);
	} catch (std::exception &e) {
		LOG(ERROR)<<e.what();
	}
}
template void caffe_gpu_set<int>(const int N, const int alpha, int* Y);
template void caffe_gpu_set<float>(const int N, const float alpha, float* Y);

template<typename T>
void caffe_gpu_dot(const int n, const T* x, const T* y, T* out) {
	BOOL_CHECK(caffe::OpenCL::clBLASdot<T>(n, x, 1, y, 1, out));
}
template void caffe_gpu_dot<float>(const int n, const float* x, const float* y, float* out);

template<typename T>
void caffe_gpu_sub(const int n, const T* a, const T* b, T* y) {
	BOOL_CHECK(caffe::OpenCL::clsub<T>(n, a, b, y));
}
template void caffe_gpu_sub<float>(const int n, const float* a, const float* b, float* y);

template<typename T>
void caffe_gpu_add(const int n, const T* a, const T* b, T* y) {
	BOOL_CHECK(caffe::OpenCL::cladd<T>(n, a, b, y));
}
template void caffe_gpu_add<float>(const int n, const float* a, const float* b, float* y);

template<typename T>
void caffe_gpu_add_scalar(const int N, const T alpha, T* Y) {
	// NOLINT_NEXT_LINE(whitespace/operators)
	//add_scalar_kernel<float><<<CAFFE_GET_BLOCKS(N), CAFFE_CUDA_NUM_THREADS>>>(N, alpha, Y);
	BOOL_CHECK( caffe::OpenCL::cladd_scalar(N, alpha, Y) );
}
template void caffe_gpu_add_scalar<float>(const int N, const float alpha, float* Y);

template<typename T>
void caffe_gpu_powx(const int n, const T* a, const T alpha, T* y) {
	BOOL_CHECK(caffe::OpenCL::clpowx<T>(n, a, alpha, y));
}
template void caffe_gpu_powx<float>(const int n, const float* a, const float alpha, float* y);

template <typename T>
void caffe_gpu_exp(const int n, const T* a, T* y) {
	BOOL_CHECK(caffe::OpenCL::clexp<T>(n, a, y));
}
template void caffe_gpu_exp<float>(const int n, const float* a, float* y);

template<typename T>
void caffe_gpu_gemv(const CBLAS_TRANSPOSE TransA, const int m, const int n, const T alpha, const T* A, const T* x, const T beta, T* y) {

	clblasTranspose clTransA;
	switch(TransA) {
		case CblasNoTrans:
			clTransA = clblasNoTrans;
			break;
		case CblasTrans:
			clTransA = clblasTrans;
			break;
		case CblasConjTrans:
			clTransA = clblasConjTrans;
			break;
		default:
			LOG(ERROR) << "unknown transpose mode.";
			return;
	}

	BOOL_CHECK(caffe::OpenCL::clBLASgemv<T>(clTransA, m, n, alpha, A, x, beta, y));
}
template void caffe_gpu_gemv<float>(const CBLAS_TRANSPOSE TransA, const int m, const int n, const float alpha, const float* A, const float* x, const float beta, float* y);

template<typename T>
void caffe_gpu_gemv(const CBLAS_TRANSPOSE TransA, const int m, const int n, const T alpha, const T* A, const int step_A, const T* x, const int step_x, const T beta, T* y, const int step_y) {

	clblasTranspose clTransA;
	switch(TransA) {
		case CblasNoTrans:
			clTransA = clblasNoTrans;
			break;
		case CblasTrans:
			clTransA = clblasTrans;
			break;
		case CblasConjTrans:
			clTransA = clblasConjTrans;
			break;
		default:
			LOG(ERROR) << "unknown transpose mode.";
			return;
	}

	BOOL_CHECK(caffe::OpenCL::clBLASgemv<T>(clTransA, m, n, alpha, A, step_A, x, step_x, beta, y, step_y));
}
template void caffe_gpu_gemv<float>(const CBLAS_TRANSPOSE TransA, const int m, const int n, const float alpha, const float* A, const int step_A, const float* x, const int step_x, const float beta, float* y, const int step_y);

template<typename T>
void caffe_gpu_gemm(const CBLAS_TRANSPOSE TransA, const CBLAS_TRANSPOSE TransB, const int M, const int N, const int K, const T alpha, const T* A, const T* B, const T beta, T* C) {

	/*
	// Note that cublas follows fortran order.
	int lda = (TransA == CblasNoTrans) ? K : M;
	int ldb = (TransB == CblasNoTrans) ? N : K;
	cublasOperation_t cuTransA = (TransA == CblasNoTrans) ? CUBLAS_OP_N : CUBLAS_OP_T;
	cublasOperation_t cuTransB = (TransB == CblasNoTrans) ? CUBLAS_OP_N : CUBLAS_OP_T;
	CUBLAS_CHECK(cublasSgemm(Caffe::cublas_handle(), cuTransB, cuTransA, N, M, K, &alpha, B, ldb, A, lda, &beta, C, N));
	*/

	clblasTranspose clTransA;
	switch(TransA) {
		case CblasNoTrans:
			clTransA = clblasNoTrans;
			break;
		case CblasTrans:
			clTransA = clblasTrans;
			break;
		case CblasConjTrans:
			clTransA = clblasConjTrans;
			break;
		default:
			LOG(ERROR) << "unknown transpose mode.";
			return;
	}

	clblasTranspose clTransB;
	switch(TransB) {
		case CblasNoTrans:
			clTransB = clblasNoTrans;
			break;
		case CblasTrans:
			clTransB = clblasTrans;
			break;
		case CblasConjTrans:
			clTransB = clblasConjTrans;
			break;
		default:
			LOG(ERROR) << "unknown transpose mode.";
			return;
	}

	//BOOL_CHECK(caffe::OpenCL::clgemm<T>(M, N, K, alpha, A, B, beta, C));
  BOOL_CHECK(caffe::OpenCL::clBLASgemm<T>(clTransA, clTransB, M, N, K, alpha, A, B, beta, C));
}
template void caffe_gpu_gemm<float>(const CBLAS_TRANSPOSE TransA, const CBLAS_TRANSPOSE TransB, const int M, const int N, const int K, const float alpha, const float* A, const float* B, const float beta, float* C);

template<typename T>
void caffe_gpu_gemm(const CBLAS_TRANSPOSE TransA, const CBLAS_TRANSPOSE TransB, const int M, const int N, const int K, const T alpha, const T* A, const int step_A, const T* B, const int step_B, const T beta, T* C, const int step_C) {

	/*
	// Note that cublas follows fortran order.
	int lda = (TransA == CblasNoTrans) ? K : M;
	int ldb = (TransB == CblasNoTrans) ? N : K;
	cublasOperation_t cuTransA = (TransA == CblasNoTrans) ? CUBLAS_OP_N : CUBLAS_OP_T;
	cublasOperation_t cuTransB = (TransB == CblasNoTrans) ? CUBLAS_OP_N : CUBLAS_OP_T;
	CUBLAS_CHECK(cublasSgemm(Caffe::cublas_handle(), cuTransB, cuTransA, N, M, K, &alpha, B, ldb, A, lda, &beta, C, N));
	*/
	clblasTranspose clTransA;
	switch(TransA) {
		case CblasNoTrans:
			clTransA = clblasNoTrans;
			break;
		case CblasTrans:
			clTransA = clblasTrans;
			break;
		case CblasConjTrans:
			clTransA = clblasConjTrans;
			break;
		default:
			LOG(ERROR) << "unknown transpose mode.";
			return;
	}

	clblasTranspose clTransB;
	switch(TransB) {
		case CblasNoTrans:
			clTransB = clblasNoTrans;
			break;
		case CblasTrans:
			clTransB = clblasTrans;
			break;
		case CblasConjTrans:
			clTransB = clblasConjTrans;
			break;
		default:
			LOG(ERROR) << "unknown transpose mode.";
			return;
	}

  //BOOL_CHECK(caffe::OpenCL::clgemm<T>(M, N, K, alpha, A, B, beta, C));
	BOOL_CHECK(caffe::OpenCL::clBLASgemm<T>(clTransA, clTransB, M, N, K, alpha, A, step_A, B, step_B, beta, C, step_C));
}
template void caffe_gpu_gemm<float>(const CBLAS_TRANSPOSE TransA, const CBLAS_TRANSPOSE TransB, const int M, const int N, const int K, const float alpha, const float* A, const int step_A, const float* B, const int step_B, const float beta, float* C, const int step_C);

template<typename T>
void caffe_gpu_gemm_simple(const int M, const int N, const int K, const T* A, const T* B, T* C) {

  BOOL_CHECK(caffe::OpenCL::clgemm<T>(M, N, K, (T) 1, A, B, (T) 0, C));

}
template void caffe_gpu_gemm_simple<float>(const int M, const int N, const int K, const float* A, const float* B, float* C);

template<typename T>
void caffe_gpu_axpy(const int N, const T alpha, const T* X, T* Y) {

	BOOL_CHECK( caffe::OpenCL::clBLASaxpy<T>(N, alpha, X, 1, Y, 1) );
}
template void caffe_gpu_axpy<float>(const int N, const float alpha, const float* X, float* Y);

template<typename T>
void caffe_gpu_axpby(const int N, const T alpha, const T* X, const T beta, T* Y) {

	caffe_gpu_scal<T>(N, beta, Y);
	caffe_gpu_axpy<T>(N, alpha, X, Y);
}
template void caffe_gpu_axpby<float>(const int N, const float alpha, const float* X, const float beta, float* Y);

template<typename T>
void caffe_gpu_scal(const int N, const T alpha, T *X) {

	//CUBLAS_CHECK(cublasSscal(Caffe::cublas_handle(), N, &alpha, X, 1));
	BOOL_CHECK( caffe::OpenCL::clBLASscal<T>(N, alpha,  X, X) );
}
template void caffe_gpu_scal<float>(const int N, const float alpha, float *X);

void caffe_gpu_rng_uniform(const int n, unsigned int* r) {
	BOOL_CHECK( caffe::OpenCL::cl_caffe_gpu_rng_uniform(n, r) );
}

template<typename T>
void caffe_gpu_rng_uniform(const int n, const T a, const T b, T* r) {
	BOOL_CHECK( caffe::OpenCL::cl_caffe_gpu_rng_uniform(n, a, b, r) );
}
template void caffe_gpu_rng_uniform<float>(const int n, const float a, const float b, float* r);

template<typename T>
void caffe_gpu_rng_gaussian(const int n, const T mu, const T sigma, T* r) {
	BOOL_CHECK( caffe::OpenCL::cl_caffe_gpu_rng_gaussian(n, mu, sigma, r) );
}
template void caffe_gpu_rng_gaussian<float>(const int n, const float mu, const float sigma, float* r);

template<typename T1, typename T2>
void caffe_gpu_rng_bernoulli(const int n, const T1 p, T2* r) {
	BOOL_CHECK( caffe::OpenCL::cl_caffe_gpu_rng_bernoulli(n, p, r) );
}
template void caffe_gpu_rng_bernoulli<float, int>(const int n, const float p, int* r);
template void caffe_gpu_rng_bernoulli<float, unsigned int>(const int n, const float p, unsigned int* r);

}  // namespace caffe

#endif // USE_OPENCL
