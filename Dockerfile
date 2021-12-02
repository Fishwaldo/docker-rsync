FROM debian:latest
MAINTAINER Justin Hammond <justin@dynam.ac>
LABEL org.opencontainers.image.source = "https://github.com/Fishwaldo/docker-rsync"
RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends rsync && \
  apt-get clean autoclean && \
  apt-get autoremove -y && \
  rm -rf /var/lib/apt/lists/* && \
  mkdir /etc/rsync/

EXPOSE 873
ADD ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
