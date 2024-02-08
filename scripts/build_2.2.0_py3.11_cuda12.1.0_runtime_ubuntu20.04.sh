#!/bin/sh

export BASE_IMAGE=nvidia/cuda:12.1.0-cudnn8-runtime-ubuntu20.04

export PYTHON_VERSION=3.11

export PYTORCH_VERSION=2.2.0
export PYTORCH_VERSION_SUFFIX=+cu121
export TORCHVISION_VERSION=0.17.0
export TORCHVISION_VERSION_SUFFIX=+cu121
export TORCHAUDIO_VERSION=2.2.0
export TORCHAUDIO_VERSION_SUFFIX=+cu121
export PYTORCH_DOWNLOAD_URL=https://download.pytorch.org/whl/cu121/torch_stable.html


export IMAGE_TAG=2.2.0-py3.11-cuda12.1.0-runtime-ubuntu20.04

./docker/ubuntu/build.sh
