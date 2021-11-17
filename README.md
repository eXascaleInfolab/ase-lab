# RecovDB: Recovery of missing values inside MonetDB

## Prerequisities 

- Clone this repository

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

### Datasets customization

To add a dataset to the recovery:
-  Name your file `original.txt` and add it to `recovery/input/`
- Requirements:  columns= 4, column separator: empty space, row separator: newline

To add a dataset to the decomposition :
- Name your file `climate.csv` and add it to `decomposition/input/`
- Requirements:  column separator: empty space, row separator: newline

### Graphical RecovDB

RecovDB is also avilable as a GUI [here](http://revival.exascale.info/recovery/recovdb.php).
___

## Citation

Please cite the following paper when using RecovDB:
``` bash
@inproceedings{arous2019recovdb,
  title={RecovDB: Accurate and Efficient Missing Blocks Recovery for Large Time Series},
  author={Arous, Ines and Khayati, Mourad and Cudr{\'e}-Mauroux, Philippe and Zhang, Ying and Kersten, Martin and Stalinlov, Svetlin},
  booktitle={2019 IEEE 35th International Conference on Data Engineering (ICDE)},
  pages={1976--1979},
  year={2019},
  organization={IEEE}
}
```
