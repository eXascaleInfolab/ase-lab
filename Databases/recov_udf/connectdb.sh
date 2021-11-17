#!/bin/bash
#killall monetdbd
monetdbd stop monetdb_farm
monetdbd start monetdb_farm
mclient -d testdb
