#!/bin/bash
sudo apt-get install zip unzip


sudo apt-get update
sudo apt-get --assume-yes upgrade
sudo apt-get --assume-yes install tmux build-essential gcc g++ make binutils
sudo apt-get --assume-yes install software-properties-common

# download and install GPU drivers
wget "http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_8.0.44-1_amd64.deb" -O "cuda-repo-ubuntu1604_8.0.44-1_amd64.deb"

sudo dpkg -i cuda-repo-ubuntu1604_8.0.44-1_amd64.deb
sudo apt-get update
sudo apt-get -y install cuda
sudo modprobe nvidia
nvidia-smi


#remove cuda from the /use/local/cuda*
rm -R  /use/local/cuda*

wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda_8.0.61_375.26_linux-run
mv cuda_8.0.61_375.26_linux-run cuda_8.0.61_375.26_linux.run
sudo sh cuda_8.0.61_375.26_linux.run


# CUDNN
wget "https://www.dropbox.com/s/1vxk9q579fobx6a/code.7z?dl=0" -O "cudnn.tgz"
tar -zxf cudnn.tgz
cd cuda
sudo cp lib64/* /usr/local/cuda/lib64/
sudo cp include/* /usr/local/cuda/include/

echo "export LD_LIBRARY_PATH=/usr/local/cuda/lib64/" >>  ~/.bashrc
source ~/.bashrc
	

# install tensorflow

sudo apt-get install libcupti-dev
sudo apt-get install python-pip python-dev 
pip install --upgrade pip

sudo pip install tensorflow-gpu h5py 

source ~/.bashrc
python -c 'import tensorflow as tf; print tf.__version__'

mkdir PycharmProjects
cd PycharmProjects
mkdir training
mkdir training/cp
wget http://www.cs.stanford.edu/people/ashesh/h3.6m.zip
unzip h3.6m.zip
rm h3.6m.zip
git clone https://github.com/Seleucia/jejumotion
cd ..
chmod -R 777 PycharmProjects
source ~/.bashrc
