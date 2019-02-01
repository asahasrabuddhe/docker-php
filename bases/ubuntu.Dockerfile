ARG version=latest
FROM ubuntu:${version}

LABEL maintainer="Ajitem Sahasrabuddhe <me@ajitem.com>"

# Prepare image
RUN apt-get update  \
    && apt-get install -y \
    curl \
    wget \
    git \
    apt-transport-https \
    lsb-release \
    ca-certificates \
    python3-software-properties \
    zip \
    unzip \
    nano \
    cron \
    supervisor \
    iputils-ping \
    locales \
    sudo

RUN [ "$version" -ne "trusty" ] apt install -y tz-data    

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

# add www-data to sudoers group
RUN echo %www-data ALL=\(ALL\) NOPASSWD:ALL > /etc/sudoers

# add message of the day generation script
COPY scripts/gen-motd.sh /etc/gen-motd.sh

# generate message of the day
RUN chmod a+x /etc/gen-motd.sh && /etc/gen-motd.sh > /etc/motd && rm /etc/gen-motd.sh

# show message of the day when a valid terminal connects
RUN echo '[ ! -z "$TERM" -a -r /etc/motd ] && cat /etc/motd' >> /root/.bashrc && mkdir -p /var/www && cp /root/.bashrc /var/www/.bashrc