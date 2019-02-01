ARG version=latest
FROM debian:${version}

LABEL maintainer="Ajitem Sahasrabuddhe <me@ajitem.com>"

# Prepare image
RUN export DEBIAN_FRONTEND=noninteractive \
    apt-get update  \
    && apt-get install -y \
    curl \
    wget \
    git \
    apt-transport-https \
    lsb-release \
    ca-certificates \
    zip \
    unzip \
    nano \
    cron \
    supervisor \
    iputils-ping \
    locales \
    sudo
    
# cleanup
RUN rm -r /var/lib/apt/lists/*

# Set Locale / Timezone
ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    && echo 'en_IN.UTF-8 UTF-8\n\
    en_US ISO-8859-1\n\
    en_US.ISO-8859-15 ISO-8859-15\n\
    en_US.UTF-8 UTF-8\n'\
    >> /etc/locale.gen &&  \
    usr/sbin/locale-gen

RUN echo %www-data ALL=\(ALL\) NOPASSWD:ALL > /etc/sudoers