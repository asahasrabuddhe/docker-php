ARG version=6
FROM centos:${version}

LABEL maintainer="Ajitem Sahasrabuddhe <me@ajitem.com>"

# Prepare image & cleanup
RUN yum update -y \
    && yum install -y \
    curl \
    wget \
    git \
    zip \
    unzip \
    nano \
    crontabs \
    tzdata \
    iputils \
    locales \
    python-setuptools \
    supervisor \
    sudo \
    && yum clean all

# Set Locale / Timezone
ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone

# add www-data to sudoers group
RUN echo %www-data ALL=\(ALL\) NOPASSWD:ALL > /etc/sudoers

# add message of the day generation script
COPY scripts/gen-motd.sh /etc/gen-motd.sh

# generate message of the day
RUN chmod a+x /etc/gen-motd.sh && /etc/gen-motd.sh > /etc/motd && rm /etc/gen-motd.sh

# show message of the day when a valid terminal connects
RUN echo '[ ! -z "$TERM" -a -r /etc/motd ] && cat /etc/motd' >> /root/.bashrc && mkdir -p /var/www && cp /root/.bashrc /var/www/.bashrc