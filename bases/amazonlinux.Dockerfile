FROM amazonlinux:2018.03

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

COPY /scripts/motd /etc/motd

RUN echo '[ ! -z "$TERM" ] && [ -r /etc/motd ] && cat /etc/motd' \
    >> /root/.bashrc