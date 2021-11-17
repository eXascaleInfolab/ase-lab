

DROP FUNCTION centroid_decomposition;
CREATE FUNCTION centroid_decomposition(x1 float, x2 float, x3 float, x4 float) RETURNS STRING LANGUAGE PYTHON {
    import sys
    import numpy as np
    import importlib
    import os

    dir_path = os.path.dirname(os.path.realpath('__file__'))
  

    src_path= dir_path +'/../decomp/src/'
    output_path = dir_path +'/../decomp/output/'



    sys.path.append(src_path)
    import cd_ssv
    matrix = []

    matrix = np.array([x1,x2,x3,x4]).T
    n =matrix.shape[0]
    m =matrix.shape[1]

    matrix_l, matrix_r, z = cd_ssv.CD(matrix,n,m)
    np.savetxt(output_path + 'L.csv',matrix_l,delimiter=',',fmt='%.3f')
    np.savetxt(output_path + 'R.csv',matrix_r,delimiter=',',fmt='%.3f')
    return str(matrix_r)
};




DROP TABLE time_series;
CREATE TABLE time_series(x1 float, x2 float, x3 float, x4 float);
COPY 1000 RECORDS INTO time_series FROM 'root_folder/decomp/src/climate.csv' USING DELIMITERS ',','\n';
SELECT centroid_decomposition(x1, x2, x3, x4) AS result FROM time_series;
