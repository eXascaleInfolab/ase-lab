import numpy as np
import recovery
import time
from numpy import genfromtxt
import os

dir_path = os.path.dirname(os.path.realpath('__file__'))
    
src_directory = dir_path
output_directory = '../output/'


input_matrix=genfromtxt(src_directory +'/incomplete.txt',delimiter=',')
n =input_matrix.shape[0]
m =input_matrix.shape[1]

trunc_col=m-1
rec_time,iterations,rmse,rec_mat = recovery.recovery(input_matrix,n,m,trunc_col,0,0)

output_matrix=np.savetxt(output_directory+'recovery.txt',rec_mat,delimiter=',',fmt='%.3f')
print(n,m,trunc_col,rec_time)

