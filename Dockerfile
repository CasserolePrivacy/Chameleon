FROM alpine:latest

WORKDIR /

COPY www/ /www
COPY .github/scripts /scriptservice
COPY python/ /scriptservice/python
COPY Chameleon/main.czco /bin/chameleon
COPY Chameleon/main.czco /usr/local/bin/chameleon
RUN  mkdir -p /var/.Chameleon/.core && ls -A > /var/.Chameleon/.core/dirsetup.czco
COPY Chameleon/Benvabuntu-Chameleon.som /root/.Chameleon/.core/.benvarc
COPY Chameleon/VerboseBootloader.bin /root/.Chameleon/.core/VerboseBootloader.bin

RUN cp /root/.Chameleon/.core/VerboseBootloader.bin /boot 
RUN apk update && apk upgrade
RUN apk add nodejs npm perl python3 py3-pip net-tools py3-cryptography py3-requests py3-paramiko py3-setuptools


USER root

EXPOSE 6721/udp
EXPOSE 6721/tcp



CMD ["bash", "/scriptservice/server"]
