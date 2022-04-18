FROM ubuntu:20.04

# TimeZone Setting
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ >/etc/timezone

# Packages
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y \
    zip \
    curl \
    dpkg \
    gnupg \
    git \
    sudo \
    openssh-server \
    build-essential \
    g++

# User setting
ARG USERNAME=${USERNAME}
RUN useradd -m -s /bin/bash $USERNAME && \
    echo "$USERNAME   ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER $USERNAME
WORKDIR /home/$USERNAME

# Install nvm => Node.js => yvm => yarn => expo & expo-cli 
ARG NODE_VERSION=${NODE_VERSION}
ARG YARN_VERSION=${YARN_VERSION}
ARG EXPO_VERSION=${EXPO_VERSION}
SHELL [ "/bin/bash", "-c" ]
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
RUN . $HOME/.nvm/nvm.sh && \
    nvm install $NODE_VERSION && \
    nvm use $NODE_VERSION && \
    curl -s https://raw.githubusercontent.com/tophat/yvm/master/scripts/install.js | node && \
    source $HOME/.yvm/yvm.sh && \
    yvm install $YARN_VERSION && \
    yvm use $YARN_VERSION && \
    echo 'export PATH="$PATH:`yarn global bin`"' >> .bashrc && \
    source $HOME/.bashrc && \
    yarn global add expo-cli@$EXPO_VERSION

# Expo server address = Private ip address
ARG REACT_NATIVE_PACKAGER_HOSTNAME=${REACT_NATIVE_PACKAGER_HOSTNAME}
RUN echo "export REACT_NATIVE_PACKAGER_HOSTNAME=$REACT_NATIVE_PACKAGER_HOSTNAME" >> $HOME/.bashrc &&\
    source $HOME/.bashrc

# Placement ssh public key
COPY ./id_rsa.pub /home/$USERNAME/.ssh/authorized_keys

USER root
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
