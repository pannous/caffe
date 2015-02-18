#!/usr/bin/env python
import h5py
import numpy as np

train_filename = 'hello_flat_world_data.hdf5'

def map_binary(x):
   # stack arrays along a third axis (depth wise)
  return (np.dstack((x&0x01,x/2&0x01,x/4&0x01,x/8&0x01,x/16&0x01,x/32&0x01))).flatten().flatten() #[0:100]     


hello=("hallo welt","hello world","hi welt","hi world")
language=(0,1,0,1)
size=len(hello)

# data = np.ndarray(shape=(size,1,10,6), dtype=np.float32)   
# x = np.ndarray(shape=(10,6), dtype=np.float32)   
data = np.ndarray(shape=(size,1,1,60), dtype=np.float32)   
x = np.ndarray(shape=(60), dtype=np.float32)   
labels =np.zeros(size)

for i in range(size):
  bytes=map(ord,hello[i])
  num=min(len(bytes),10)
  ords=np.array(bytes[:num]).astype('int')
  print num
  bords=map_binary(ords)
  print bords
  numnum=min(len(bords),42)
  x[0:numnum]=bords[0:numnum]
  data[i]=x[np.newaxis,:]
  labels[i]=language[i]
  
with h5py.File(train_filename, 'w') as f:
  f['data'] = data.astype(np.float32)
  f['label'] = labels.astype(np.float32)