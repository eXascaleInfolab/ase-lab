import numpy as np
import cd_ssv
import time


dir_path = os.path.dirname(os.path.realpath('__file__'))

src_directory = dir_path  +'/src/'


input_matrix=np.loadtxt(src_directory+'climate.csv',delimiter=',')
n =input_matrix.shape[0]
m =input_matrix.shape[1]


ts1 = time.time()
matrix_l, matrix_r, z = cd_ssv.CD(input_matrix,n,m)
ts2 = time.time()
print(ts2 - ts1)

np.savetxt('../files/L.csv',matrix_l,delimiter=',',fmt='%.3f')
np.savetxt('../files/R.csv',matrix_r,delimiter=',',fmt='%.3f')
