ARG BASE_IMAGE

FROM ${BASE_IMAGE}
# RUN apt-get update && apt-get install -y sed

RUN sed -i 's/archive.ubuntu.com/cn.archive.ubuntu.com/g' /etc/apt/sources.list


ENV NVIDIA_DRIVER_CAPABILITIES ${NVIDIA_DRIVER_CAPABILITIES:-compute,utility}

RUN apt update && \
    apt install -y \
        wget build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev \
        libreadline-dev libffi-dev libsqlite3-dev libbz2-dev liblzma-dev && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

ARG PYTHON_VERSION

RUN cd /tmp && \
    wget https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz && \
    tar -xvf Python-${PYTHON_VERSION}.tgz && \
    cd Python-${PYTHON_VERSION} && \
    ./configure --enable-optimizations && \
    make && make install && \
    cd .. && rm Python-${PYTHON_VERSION}.tgz && rm -r Python-${PYTHON_VERSION} && \
    ln -s /usr/local/bin/python3 /usr/local/bin/python && \
    ln -s /usr/local/bin/pip3 /usr/local/bin/pip && \
    python -m pip install --upgrade pip && \
    rm -r /root/.cache/pip

ARG PYTORCH_VERSION
ARG PYTORCH_VERSION_SUFFIX
ARG TORCHVISION_VERSION
ARG TORCHVISION_VERSION_SUFFIX
ARG TORCHAUDIO_VERSION
ARG TORCHAUDIO_VERSION_SUFFIX
ARG PYTORCH_DOWNLOAD_URL
ARG ULTRALYTICS_VERSION

RUN if [ ! $TORCHAUDIO_VERSION ]; \
    then \
        TORCHAUDIO=; \
    else \
        TORCHAUDIO=torchaudio==${TORCHAUDIO_VERSION}${TORCHAUDIO_VERSION_SUFFIX}; \
    fi && \
    if [ ! $PYTORCH_DOWNLOAD_URL ]; \
    then \
        pip install \
            torch==${PYTORCH_VERSION}${PYTORCH_VERSION_SUFFIX} \
            torchvision==${TORCHVISION_VERSION}${TORCHVISION_VERSION_SUFFIX} \
            ${TORCHAUDIO}; \
    else \
        pip install \
            torch==${PYTORCH_VERSION}${PYTORCH_VERSION_SUFFIX} \
            torchvision==${TORCHVISION_VERSION}${TORCHVISION_VERSION_SUFFIX} \
            ${TORCHAUDIO} \
            -f ${PYTORCH_DOWNLOAD_URL}; \
    fi && \
    rm -r /root/.cache/pip

RUN pip install ultralytics==${ULTRALYTICS_VERSION}

WORKDIR /workspace
