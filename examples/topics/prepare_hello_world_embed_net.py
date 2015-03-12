#!/usr/bin/env python
import h5py
import numpy as np

train_filename = 'hello_world_embed_data.hdf5'

hello=("hallo welt","hello world","hi welt","hi world")
language=(0,1,0,1) # 0==german 1==english
size=len(hello)

data = np.ndarray(shape=(size,1,10,1), dtype=np.float32)   
sentence = np.ndarray(shape=(10,1), dtype=np.float32)   
labels =np.zeros(size)

for i in range(size):
  bytes=map(ord,hello[i])
  num=min(len(bytes),10)
  ords=np.array(bytes[:num]).astype('int')
  # sentence[0:num]=ords[np.newaxis,:]
  sentence[0:num]=ords[:,np.newaxis]
  data[i]=sentence[np.newaxis,:]
  labels[i]=language[i]
  
with h5py.File(train_filename, 'w') as f:
  f['sentence'] = data.astype(np.float32)
  f['language'] = labels.astype(np.float32)