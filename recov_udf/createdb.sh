filename=~/.monetdb
if [ ! -f $filename ]
then
    touch $filename
    echo 'user=monetdb' >> $filename
    echo 'password=monetdb' >> $filename
fi

monetdbd stop monetdb_farm
rm -rf monetdb_farm/
monetdbd create monetdb_farm
monetdbd start monetdb_farm
monetdb create testdb
monetdb release testdb
monetdb set embedpy=yes testdb
sed -i "s#root_folder#$(pwd)#g" decomp_udf.sql
sed -i "s#root_folder#$(pwd)#g" recov_udf.sql
