# Based on instructions here: https://www.vultr.com/docs/setup-nginx-rtmp-on-ubuntu-14-04
# Using Ubuntu 20.04 (focal)

FROM ubuntu:focal AS build

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
	&& apt-get -y dist-upgrade \
	&& apt-get -y install \
		build-essential \
		libpcre3 \
		libpcre3-dev \
		libssl-dev \
		zlib1g-dev \
		unzip \
		ffmpeg \
		nginx \
		libnginx-mod-rtmp \
	&& apt-get clean \
	&& rm -rf /var/cache/apt

# Copy string
# execute init_srv
# reload nginx server
# thats all :9


EXPOSE 1935 8080
CMD ["/usr/local/bin/start.sh"]