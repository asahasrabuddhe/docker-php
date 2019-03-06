ARG version=6
FROM centos:${version}

LABEL maintainer="Ajitem Sahasrabuddhe <me@ajitem.com>"

RUN yum -y install \
    curl \
    wget \
    git \
    zip \
    unzip \
    nano \
    cron \
    tzdata \
    locales \
    sudo \
    python-setuptools \
    && yum clean all

RUN mkdir -p /var/log/supervisor \
    && easy_install supervisor

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