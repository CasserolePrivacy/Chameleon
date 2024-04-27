FROM alpine:latest

WORKDIR /
RUN adduser --disabled-password --gecos "" chameleon

COPY www/ /www
COPY scripts /scriptservice
COPY python/ /scriptservice/python
COPY Chameleon/main.czco /bin/chameleon
COPY Chameleon/main.czco /usr/local/bin/chameleon
RUN  chmod a+x /usr/local/bin/chameleon
RUN  mkdir -p /var/.Chameleon/.core && chown chameleon:chameleon /var/.Chameleon/ && ls -A > /var/.Chameleon/.core/dirsetup.czco
COPY Chameleon/Benvabuntu-Chameleon.som /home/chameleon/.Chameleon/.core/.benvarc
COPY Chameleon/VerboseBootloader.bin /home/chameleon/.Chameleon/.core/VerboseBootloader.bin
RUN touch  /var/log/Chameleon.log
RUN chown -R chameleon:chameleon /home/chameleon/.Chameleon/
RUN chown  chameleon:chameleon /var/log/Chameleon.log


RUN cp /home/chameleon/.Chameleon/.core/VerboseBootloader.bin /boot 
RUN apk update && apk upgrade
RUN apk add bash perl python3 py3-flask py3-pip net-tools py3-cryptography py3-requests py3-paramiko py3-setuptools

USER chameleon

ENV web=true
ENV key=null
ENV port=6721

EXPOSE $port/tcp



CMD ["bash", "/scriptservice/server"]
