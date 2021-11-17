# User Defined Function on TSMS: Recovery of missing values inside MonetDB


### UDF Configuration (Ubuntu/Debian)

- Enter the cloned repo and run the following commands


``` bash 
$ sh monetdb_install.sh
$ sh createdb.sh
```

### UDF Configuration (macOS)

- Enter the cloned repo and run the following commands


``` bash 
$ brew install monetdb
$ pip3 install numpy
$ sh createdb.sh
```

#### Python Path Configuration

- Install Anaconda2 from: https://docs.anaconda.com/anaconda/install/ in your 'HOME' folder

- Add the following line to (.profile or .bash_profile):

 `export PYTHONPATH="${PYTHONPATH}:'HOME'/anaconda2/lib/python2.7/site-packages/"`

- Execute and restart:
``` bash 
$ source .profile (or source bash_profile)
$ sudo shutdown -r now
```

___


## Execution

### Recovery of missing values in time series data

We show how to recover overlapping missing blocks in two climate time series located in `recovery/input/original.txt`

``` bash
$ sh connectdb.sh
$ sh mclient -u monetdb -d testdb -p monetdb
sql> \<./recov_udf.sql
sql> \q
```

### Centroid Decomposition of time series data

We show how to decompose a matrix of time series located in `decomposition/input/climate.csv`

``` bash
$ sh connectdb.sh
sql> \<./decomp_udf.sql
sql> \q
```
