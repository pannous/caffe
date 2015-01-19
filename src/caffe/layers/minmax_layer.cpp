#include <algorithm>
#include <vector>

#include "caffe/layer.hpp"
#include "caffe/vision_layers.hpp"

namespace caffe {

template <typename Dtype>
void MinMaxLayer<Dtype>::Forward_cpu(const vector<Blob<Dtype>*>& bottom,
    const vector<Blob<Dtype>*>& top) {
  const Dtype* bottom_data = bottom[0]->cpu_data();
  Dtype* top_data = top[0]->mutable_cpu_data();
  const int count = bottom[0]->count();
  Dtype negative_slope = this->layer_param_.MinMax_param().negative_slope();
  for (int i = 0; i < count; ++i) {
    top_data[i] =  std::max(Dtype(-1), std::min(bottom_data[i], Dtype(1)));

  }
}

template <typename Dtype>
void MinMaxLayer<Dtype>::Backward_cpu(const vector<Blob<Dtype>*>& top,
    const vector<bool>& propagate_down,
    const vector<Blob<Dtype>*>& bottom) {
  if (propagate_down[0]) {
    const Dtype* bottom_data = bottom[0]->cpu_data();
    const Dtype* top_diff = top[0]->cpu_diff();
    Dtype* bottom_diff = bottom[0]->mutable_cpu_diff();
    const int count = bottom[0]->count();
    for (int i = 0; i < count; ++i) {
      bottom_diff[i] = top_diff[i] * ((bottom_data[i] >= -1) * (bottom_data[i] <= 1));
    }
  }
}


#ifdef CPU_ONLY
STUB_GPU(MinMaxLayer);
#endif

INSTANTIATE_CLASS(MinMaxLayer);


}  // namespace caffe
