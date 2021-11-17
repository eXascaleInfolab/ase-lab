
DROP FUNCTION centroid_decomposition;
CREATE FUNCTION centroid_decomposition(x1 float, x2 float, x3 float, x4 float) RETURNS STRING LANGUAGE PYTHON {
    import sys
    import numpy as np
    import importlib
    import os

    
    
    dir_path = os.path.dirname(os.path.realpath('__file__'))


 
    src_path= dir_path +'/../recovery/src/'
    output_path = dir_path +'/../recovery/output/'


    sys.path.append(src_path)
    import recovery
    matrix = []

    matrix = np.array([x1,x2,x3,x4]).T
    n =matrix.shape[0]
    m =matrix.shape[1]
    k=3

    rec_time,iter,rmse,rec_mat = recovery.recovery(matrix,n,m,k,0,0)
    np.savetxt(output_path+'recovery.txt',rec_mat,delimiter=',',fmt='%.3f')
    return str(rec_mat)
};




DROP TABLE time_series;
CREATE TABLE time_series(x1 float, x2 float, x3 float, x4 float);
COPY 20 RECORDS INTO time_series FROM 'root_folder/recovery/src/incomplete.txt' USING DELIMITERS ',','\n' NULL AS '';
SELECT centroid_decomposition(x1, x2, x3, x4) AS result FROM time_series;
