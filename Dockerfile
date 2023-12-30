# build script: 
# docker build -f Dockerfile -t lumeny/cogvlm:latest .
FROM nvidia/cuda:12.1.1-devel-ubuntu22.04 
# FROM pytorch/pytorch:latest

WORKDIR /

# RUN ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime && \
RUN DEBIAN_FRONTEND=noninteractive apt update && apt install -y --no-install-recommends \
  python3 python3-pip git curl wget software-properties-common 


# SHELL ["/bin/bash", "--login", "-c"]

RUN apt-get update && apt-get install ffmpeg libsm6 libxext6 -y

RUN git clone https://github.com/LumenYoung/CogVLM.git && \
  cd CogVLM && \
  pip3 install -r requirements.txt && \ 
  python3 -m spacy download en_core_web_sm 

WORKDIR /CogVLM

# for installing bnb 
# jsonlines for the sat usage
RUN pip3 install scipy bitsandbytes jsonlines 
