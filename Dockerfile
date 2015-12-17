FROM ubuntu:trusty
MAINTAINER info@analogic.cz

ADD https://github.com/just-containers/s6-overlay/releases/download/v1.11.0.1/s6-overlay-amd64.tar.gz /tmp/
RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C /
ENTRYPOINT ["/init"]

RUN echo 'deb http://archive.ubuntu.com/ubuntu/ trusty universe' >> /etc/apt/sources.list && \
    echo 'deb http://archive.ubuntu.com/ubuntu/ trusty multiverse' >> /etc/apt/sources.list && \
    echo 'deb http://archive.ubuntu.com/ubuntu/ trusty-updates multiverse' >> /etc/apt/sources.list && \
    echo 'deb http://archive.ubuntu.com/ubuntu/ trusty-security multiverse' >> /etc/apt/sources.list && \
    apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends cacti cacti-spine snmp-mibs-downloader
RUN echo "ServerName localhost" | sudo tee /etc/apache2/conf-available/fqdn.conf
RUN echo "Europe/Prague" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

VOLUME ["/var/lib/cacti/rra/", "/var/log"]
ADD rootfs /
EXPOSE 80


