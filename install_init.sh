#!/bin/sh

sudo apt update

# Python2.7
sudo apt install -y python
sudo apt install -y python-pip
sudo pip install tqdm
sudo pip install numpy
sudo pip install pandas
sudo pip install saxpy
sudo pip install pydruid
sudo pip install protobuf==3.13.0
sudo pip install influxdb
sudo pip install cassandra-driver


# Python3.6
sudo apt install -y python3
sudo apt install -y python3-pip
sudo pip3 install saxpy
sudo pip3 install numpy
sudo pip3 install pydruid
sudo pip3 install pandas
sudo pip3 install protobuf==3.13.0
sudo pip3 install tqdm
sudo pip3 install influxdb
sudo pip3 install cassandra-driver

# Java
sudo apt-get install -y openjdk-8-jdk
sudo update-java-alternatives --jre-headless --jre --set java-1.8.0-openjdk-amd64

# Maven
sudo apt install -y maven

# Curl
sudo apt install -y curl

# Docker
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker
