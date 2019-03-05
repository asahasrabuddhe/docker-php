ARG version=latest
FROM centos:${version}

LABEL maintainer="Ajitem Sahasrabuddhe <me@ajitem.com>"

# Prepare image & cleanup
RUN yum update -y \
    && yum install -y \
    wget \
    git \
    zip \
    unzip \
    nano \
    crontabs \
    python \
    iputils \
    locales \
    sudo \
    && yum clean all

# As supervisor is not a package available in the yum repositories, install it manually *cringe*
RUN curl -sSL https://bootstrap.pypa.io/get-pip.py | python \
    && pip install supervisor

COPY scripts/supervisord /etc/init.d/supervisord

RUN chmod a+x /etc/init.d/supervisord

# Set Timezone
ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone

RUN echo %www-data ALL=\(ALL\) NOPASSWD:ALL > /etc/sudoers

# add message of the day generation script
COPY scripts/gen-motd.sh /etc/gen-motd.sh

# generate message of the day
RUN chmod a+x /etc/gen-motd.sh && /etc/gen-motd.sh > /etc/motd && rm /etc/gen-motd.sh

# show message of the day when a valid terminal connects
RUN echo '[ ! -z "$TERM" -a -r /etc/motd ] && cat /etc/motd' >> /root/.bashrc && mkdir -p /var/www && cp /root/.bashrc /var/www/.bashrc