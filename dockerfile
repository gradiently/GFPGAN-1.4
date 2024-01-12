FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-runtime

COPY . /workspace/GFPGAN

WORKDIR /workspace/GFPGAN

# Install basicsr - https://github.com/xinntao/BasicSR
# We use BasicSR for both training and inference
RUN pip install basicsr

# Install facexlib - https://github.com/xinntao/facexlib
# We use face detection and face restoration helper in the facexlib package
RUN pip install facexlib

RUN pip install -r requirements.txt
RUN python setup.py develop
RUN ln -s /home/jupyter /workspace/GFPGAN/storage