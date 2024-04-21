FROM alpine:latest

WORKDIR /
RUN adduser --disabled-password --gecos "" chameleon

COPY www/ /www
COPY scripts /scriptservice
COPY python/ /scriptservice/python
COPY Chameleon/main.czco /bin/chameleon
COPY Chameleon/main.czco /usr/local/bin/chameleon
RUN  mkdir -p /var/.Chameleon/.core && chown chameleon:chameleon /var/.Chameleon/ && ls -A > /var/.Chameleon/.core/dirsetup.czco
COPY Chameleon/Benvabuntu-Chameleon.som /home/chameleon/.Chameleon/.core/.benvarc
COPY Chameleon/VerboseBootloader.bin /home/chameleon/.Chameleon/.core/VerboseBootloader.bin

RUN cp /home/chameleon/.Chameleon/.core/VerboseBootloader.bin /boot 
RUN apk update && apk upgrade
RUN apk add bash perl python3 py3-flask py3-pip net-tools py3-cryptography py3-requests py3-paramiko py3-setuptools

ENV web=true
ENV key=null

EXPOSE 5000/tcp



CMD ["bash", "/scriptservice/server"]
