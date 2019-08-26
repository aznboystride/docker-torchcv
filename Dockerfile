FROM nvidia/cuda:10.0-base-ubuntu18.04

MAINTAINER Fair N. Aboshehwa "https://github.com/aznboystride"

# install system executables and download anaconda
RUN apt-get update && apt install curl zip libsm6 libxext6 libxrender-dev -y && curl -o anaconda.sh https://repo.anaconda.com/archive/Anaconda3-2019.07-Linux-x86_64.sh && chmod u+x anaconda.sh


# install anaconda
RUN mkdir ~/.conda && bash anaconda.sh -b -p ~/anaconda3 && rm anaconda.sh

# install cudatoolkit and pytorch opencv
CMD ["source", "~/.bashrc"]
CMD ["pip", "install", "opencv-python"]
CMD ["conda", "install", "-c", "anaconda", "cudatoolkit"] 
CMD ["conda", "install", "-c", "pytorch", "torchvision"]
