FROM alpine:3.19.1

LABEL com.casseroleprivacy.chameleon.vendor="support@casseroleprivacy.com"
LABEL com.casseroleprivacy.chameleon.maintainer="support@casseroleprivacy.com"
LABEL com.casseroleprivacy.chameleon.title="Casserole Chameleon"
LABEL com.casseroleprivacy.chameleon.url="https://casseroleprivacy.com"
LABEL com.casseroleprivacy.chameleon.source="https://casseroleprivacy.com"
LABEL com.casseroleprivacy.chameleon.licenses="BSD 3-Clause"

LABEL com.casseroleprivacy.chameleon.version="Pre-Release"
LABEL version="Pre-Release"

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
RUN apk --no-cache add bash perl python3 py3-pip net-tools

RUN rm /usr/lib/python3.11/EXTERNALLY-MANAGED


USER chameleon

ENV web=true
ENV key=null
ENV port=6721
ENV telemetry=false
ENV debug=false

HEALTHCHECK --interval=1m --timeout=3s \
  CMD curl -f http://localhost:${port}/health || exit 1

EXPOSE $port/tcp


CMD ["bash", "/scriptservice/server"]
