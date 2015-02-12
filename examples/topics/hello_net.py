#!/usr/bin/env python
import h5py
import numpy as np

train_filename = 'hello_world_data.hdf5'

hello=("hallo welt","hello world","hi welt","hi world")
language=(0,1,0,1)
size=len(hello)

data = np.ndarray(shape=(lines,chars), dtype=np.float32)   
labels =np.zeros(lines)

for i in range(size)
  bytes=map(ord,hello[i])
  num=min(len(bytes),10)
  data[i][0:num]=bytes[:num]    
  labels[i]=language[i]
  
with h5py.File(train_filename, 'w') as f:
  f['data'] = data.astype(np.float32)
  f['label'] = labels.astype(np.float32)