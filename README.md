# Lab of Time Series Database Systems

___
## Prerequisites and dependencies

- Ubuntu 18 or higher
- Clone this repository

___
## Build

- Install the prerequisites

```bash
sh install_init.sh
```

- To build a given database, run the installation script located in the database folder. For example, to install druid

```bash
cd Databases/timescaledb
sh install.sh
```
### Alternatively
- You can use the `docker-compose.yaml` file to create an instance of TimescaleDB locally.
```bash
docker-compose up -d
``` 
- Yet, you still need a PostgreSQL client to interact with it.
```bash
sudo apt install -y postgresql-11
``` 
- [Commands to load data](./Database/../Databases/timescaledb/data-loading.txt) should work out of the box since the absolute path is the same in the Docker container.
___
## Dataset

We will use water data (```datasets.csv```) of 1M readings originating from 50 different stations with the following format: 

```
time,id_station,temperature,discharge,pH,oxygen,oxygen_saturation
2019-03-01 00:00:00,47,407.052,0.954,7.79,12.14,12.14
2019-03-01 00:00:10,50,407.052,0.954,7.79,12.13,12.13
2019-03-01 00:00:20,7,407.051,0.954,7.79,12.13,12.13
2019-03-01 00:00:30,25,407.051,0.953,7.79,12.12,12.12
```

___
## Part I: Simple Queries

The queries for each system can be found in ```Databases/{database}/simple-queries.txt```

#### Q1 : Time Range Select 
#### Q2 : Time Range Aggregation 
#### Q3 :  Downsampling
#### Q4 : Upsampling


## [TimescaleDB](https://docs.timescale.com/timescaledb/latest/getting-started/#let-x27-s-get-up-and-running)

- To launch and enable TimescaleDB, run the following script:  
``` bash 
$ psql
psql> CREATE EXTENSION IF NOT EXISTS timescaledb CASCADE;
```

## [Druid](https://druid.apache.org/docs/latest/design/index.html)

- To launch Druid, run the following script: 

``` bash 
$ ./apache-druid-0.22.0/bin/start-micro-quickstart
```

- Then, test the Druid server: 

``` bash 
curl http://localhost:8888/unified-console.html
```  


___
## Part II: Advanced Analytic using User Defined Functions (UDFs) 

*Task* : Recovery of missing values in time series using MonetDB


### UDF Configuration 

- Enter the ```Databases/recov_udf/``` folder and run the following commands:


``` bash 
$ cd Databases/recov_udf/
$ sh monetdb_install.sh
$ sh createdb.sh
```

### Recovery of missing values in time series data

We show how to recover missing blocks in multiple climate time series (located in `recovery/input/original.txt`)

``` bash
$ cd Databases/recovdb_udf
$ sh connectdb.sh
sql> \<./recov_udf.sql
sql> \q
```
