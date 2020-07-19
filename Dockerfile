FROM ubuntu:latest
RUN apt-get update && apt-get install -y \
  sudo \
  wget \
  vim
WORKDIR /opt
RUN wget https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh && \
  sh Anaconda3-2020.02-Linux-x86_64.sh -b -p /opt/anaconda3 && \
  rm -f Anaconda3-2020.02-Linux-x86_64.sh
ENV PATH=$PATH:/opt/anaconda3/bin
RUN pip install  --upgrade pip
WORKDIR /
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--LabApp.token=''"]

