## Taking Image from Docker Hub for Programming language support
FROM rajanagori/nightingale_programming_image:v1 

## Installing tools using apt-get for web vapt
RUN \
    apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y \
    git \
    make \
    cmake \
    bundler

### Creating Directories
RUN \
    cd /home &&\
    mkdir -p tools_network_vapt

ENV TOOLS_NETWORK_VAPT=/home/tools_network_vapt/

WORKDIR ${TOOLS_NETWORK_VAPT}

# git clonning of tools repository
RUN \
    # Git clone of nikto
    git clone --depth 1 https://github.com/sullo/nikto 

WORKDIR /home

# Cleaning Unwanted libraries 
RUN apt-get -y autoremove &&\
    apt-get -y clean &&\
    rm -rf /tmp/* &&\
    rm -rf /var/lib/apt/lists/*
    