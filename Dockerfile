# avoiding issues with cuda 11.1
FROM nvcr.io/nvidia/pytorch:20.09-py3

RUN pip install transformers==3.5.1

# WORKDIR /data2/transformers/examples/question-answering
WORKDIR /
RUN git clone -b v3.5.1 https://github.com/huggingface/transformers.git
WORKDIR /transformers/examples/question-answering

COPY dev-v1.1.json .
COPY dev-v2.0.json .
COPY train-v1.1.json .
COPY train-v2.0.json .
COPY runmp.sh .
COPY run_squad.sh .
COPY run_squad.py .
