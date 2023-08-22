FROM debian:trixie

# Install dependencies only when needed
# Check https://github.com/nodejs/docker-node/tree/b4117f9333da4138b03a546ec926ef50a31506c3#nodealpine to understand why libc6-compat might be needed.
RUN apt update && apt install sudo -y
WORKDIR /


COPY install.sh /
COPY Chameleon/main.czco /bin/chameleon
COPY Chameleon/main.czco /usr/local/bin/chameleon
RUN mkdir ~/.Chameleon && sudo mkdir ~/.Chameleon/.core && ls -A > ~/.Chameleon/.core/dirsetup.czco && sudo cp ~/.bashrc ~/.Chameleon/.core/bashrc-backup.czco
COPY Chameleon/Benvabuntu-Chameleon.som /root/.Chameleon/.core/.benvarc
COPY Chameleon/VerboseBootloader.bin /root/.Chameleon/.core/VerboseBootloader.bin
RUN cp /root/.Chameleon/.core/VerboseBootloader.bin /boot 

USER root
RUN  apt upgrade && sudo apt install perl python3 whiptail net-tools -y


EXPOSE 6721

ENV PORT 6721



CMD ["bash", "chameleon", "dockerresult-lnt-pleasedontusethis"]