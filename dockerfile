FROM debian:stable

RUN apt update && apt install sudo -y
WORKDIR /


COPY www/ /www
COPY Chameleon/main.czco /bin/chameleon
COPY Chameleon/main.czco /usr/local/bin/chameleon
RUN mkdir ~/.Chameleon &&  mkdir ~/.Chameleon/.core && ls -A > ~/.Chameleon/.core/dirsetup.czco &&  cp ~/.bashrc ~/.Chameleon/.core/bashrc-backup.czco
COPY Chameleon/Benvabuntu-Chameleon.som /root/.Chameleon/.core/.benvarc
COPY Chameleon/VerboseBootloader.bin /root/.Chameleon/.core/VerboseBootloader.bin
RUN cp /root/.Chameleon/.core/VerboseBootloader.bin /boot 

USER root
RUN  apt autoremove
RUN  apt upgrade &&  apt install perl python3 whiptail net-tools nodejs npm -y


EXPOSE 6721/udp
EXPOSE 6721/tcp



CMD ["node", "/www/index.js"]