FROM debian:buster-slim


ENV USER USER
ENV PASS PASS
ENV LOCATION LOCATION
ENV MODE MODE

COPY ovpn/ /ovpn/

RUN apt-get update && apt-get install -y \
    unzip wget openvpn curl \
    && wget -q https://account.surfshark.com/api/v1/server/configurations -O /ovpn/configurations \
    && unzip /ovpn/configurations -d /ovpn/ovpn-servers/ \
    && rm /ovpn/configurations \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get purge -y --autoremove wget unzip

HEALTHCHECK --interval=90s --timeout=10s --start-period=30s CMD curl -L 'https://ipinfo.io'

EXPOSE 1194/udp

ENTRYPOINT ["/bin/bash","/ovpn/start.sh"]
