# Lab of Time Series Database Systems

___
## Prerequisites and dependencies

- Ubuntu 18 or higher
- Clone this repository
- All other dependencies will be installed via the install script.

___
## Build

- Install the prerequisites

```bash
sh install_init.sh
```

### Build a Database

To build a particular database, run the installation script located in the database folder. For example, to install druid

```bash
cd Databases/druid
sh install.sh
```
___
## Dataset

We use water data in the ```datasets.csv``` of 1M readings belonging to 50 different stations with the following format: 

```
time,id_station,temperature,discharge,pH,oxygen,oxygen_saturation
2019-03-01 00:00:00,47,407.052,0.954,7.79,12.14,12.14
2019-03-01 00:00:10,50,407.052,0.954,7.79,12.13,12.13
2019-03-01 00:00:20,7,407.051,0.954,7.79,12.13,12.13
2019-03-01 00:00:30,25,407.051,0.953,7.79,12.12,12.12
```

___
## Part I: Simple Queries

The queries for each system are found in ```Databases/{database}/simple-queries.txt```

### Q1 : Time Range Select 
### Q2 : Time Range Aggregation 
### Q3 :  Downsampling
### Q4 : Upsampling


## [Druid](https://druid.apache.org/docs/latest/design/index.html)

To launch Druid, run the following script: 

``` bash 
$ ./apache-druid-0.22.0/bin/start-micro-quickstart
```

Then test the Druid server: 

``` bash 
curl http://localhost:8888/unified-console.html
```  


## [TimescaleDB](https://docs.timescale.com/timescaledb/latest/getting-started/#let-x27-s-get-up-and-running)

To launch and enable TimescaleDB, run the following script:  
``` bash 
$ psql
psql> CREATE EXTENSION IF NOT EXISTS timescaledb CASCADE;

```



___
## Part II: User Defined Function on TSMS: Recovery of missing values inside MonetDB


### UDF Configuration (Ubuntu/Debian)

- Enter the ```Databases/reconv_udf/``` folder and run the following commands, the installation scripts takes around 15 minutes. 


``` bash 
$ sh monetdb_install.sh
$ sh createdb.sh
```

### Execution

### Recovery of missing values in time series data

We show how to recover overlapping missing blocks in two climate time series located in `recovery/input/original.txt`

``` bash
$ cd Databases/recovdb_udf
$ sh connectdb.sh
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
