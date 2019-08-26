FROM nvidia/cuda:10.0-base-ubuntu18.04

MAINTAINER Fair Aboshehwa "https://github.com/aznboystride"

# install system executables and download anaconda
RUN apt-get update && apt install curl zip libsm6 libxext6 libxrender-dev -y && curl -o anaconda.sh https://repo.anaconda.com/archive/Anaconda3-2019.07-Linux-x86_64.sh && chmod u+x anaconda.sh

# install anaconda
RUN bash anaconda.sh -b -p /root/anaconda3 && rm anaconda.sh && source /root/.bashrc

# install cudatoolkit and pytorch
RUN conda install -c anaconda cudatoolkit && conda install -c pytorch torchvision

# install opencv
RUN pip install opencv-python


