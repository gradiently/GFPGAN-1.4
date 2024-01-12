FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-runtime

# Install basicsr - https://github.com/xinntao/BasicSR
# We use BasicSR for both training and inference
RUN pip install basicsr

# Install facexlib - https://github.com/xinntao/facexlib
# We use face detection and face restoration helper in the facexlib package
RUN pip install facexlib

# move and install first to get docker cache
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . /workspace/GFPGAN
WORKDIR /workspace/GFPGAN

RUN python setup.py develop
RUN ln -s /home/jupyter /workspace/GFPGAN/storage