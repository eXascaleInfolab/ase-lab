sudo touch /etc/apt/sources.list.d/monetdb.list
sudo chmod 777 /etc/apt/sources.list.d/monetdb.list
echo "deb https://dev.monetdb.org/downloads/deb/ $(lsb_release -cs) monetdb" >> /etc/apt/sources.list.d/monetdb.list
echo "deb-src https://dev.monetdb.org/downloads/deb/ $(lsb_release -cs) monetdb" >> /etc/apt/sources.list.d/monetdb.list
wget --output-document=- https://www.monetdb.org/downloads/MonetDB-GPG-KEY | sudo apt-key add -
sudo apt update
wget https://www.monetdb.org/downloads/sources/Nov2019-SP3/MonetDB-11.35.19.zip 
sudo apt install unzip
unzip MonetDB-11.35.19.zip
sudo rm -rf MonetDB-11.35.19.zip
cd MonetDB-11.35.19/
echo "installing dependencies..."
sudo apt install automake bison gettext libssl-dev libtool libxml2-dev m4 make mercurial pkg-config
sudo apt install libatomic-ops-dev python-dev python-numpy uuid-dev
./bootstrap
./configure --enable-pyintegration
sudo make
sudo make install
echo "installing monetdb client..."
sudo apt install monetdb-client
 


