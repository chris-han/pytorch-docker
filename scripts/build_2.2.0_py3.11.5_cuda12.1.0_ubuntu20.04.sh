#!/bin/sh

export BASE_IMAGE=ubuntu:20.04

export PYTHON_VERSION=3.11.5

export PYTORCH_VERSION=2.2.0
export PYTORCH_VERSION_SUFFIX=+cu121
export TORCHVISION_VERSION=0.17.0
export TORCHVISION_VERSION_SUFFIX=+cu121
export TORCHAUDIO_VERSION=2.2.0
export TORCHAUDIO_VERSION_SUFFIX=+cu121
export PYTORCH_DOWNLOAD_URL=https://download.pytorch.org/whl/cu121/torch_stable.html
export ULTRALYTICS_VERSION=8.0.221
export IMAGE_TAG=2.2.0-py3.11.5-cuda12.1.0-ubuntu20.04

./docker/ubuntu/build.sh
