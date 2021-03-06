#!/bin/sh
#Remove firefox if the verion exceeds 50
sudo apt-get purge
#Update system before installing new packages
sudo apt-get update
# Install firefox45 version
wget https://ftp.mozilla.org/pub/firefox/releases/45.0/linux-x86_64/en-US/firefox-45.0.tar.bz2
tar -xjf firefox-45.0.tar.bz2
sudo rm -rf  /opt/firefox
sudo mv firefox /opt/firefox45
sudo mv /usr/bin/firefox /usr/bin/firefoxold
sudo ln -s /opt/firefox45/firefox /usr/bin/firefox

#openjdk is required to install Java3d 
sudo apt-get install -y openjdk-7-jre
sudo apt-get install -y openjdk-7-jdk
#Downloading the Java3d package for 64-bit system
wget download.java.net/media/java3d/builds/release/1.5.2/j3d-1_5_2-linux-amd64.zip
#extracting the files
unzip j3d-1_5_2-linux-amd64.zip 
cd j3d-1_5_2-linux-amd64/
unzip j3d-jre.zip -d /tmp/j3d-jre/
#Place all Jar files to a same directory 
sudo cp /tmp/j3d-jre/lib/ext/*.jar /usr/lib/jvm/java-7-openjdk-amd64/jre/lib/ext/
sudo cp /tmp/j3d-jre/lib/amd64/* /lib
#Modify your CLASSPATH environment variable to include the full paths to j3dcore.jar, j3dutils.jar, and vecmath.jar
export CLASSPATH=.:/tmp/j3d-jre/lib/ext/j3dcore.jar:/tmp/j3d-jre/lib/ext/j3dutils.jar:/tmp/j3d-jre/lib/ext/vecmath.jar 
#Modify your CLASSPATH environment variable to include the full paths to j3dcore.jar, j3dutils.jar, and vecmath.jar
export LD_LIBRARY_PATH=/tmp/j3d-jre/lib/amd64
#All jre should go in /lib/ in ubuntu
sudo cp /tmp/j3d-jre/lib/amd64/* /lib/
sudo apt-get install -y icedtea-plugin
