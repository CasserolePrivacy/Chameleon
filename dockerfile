FROM debian:latest

# Install dependencies only when needed
# Check https://github.com/nodejs/docker-node/tree/b4117f9333da4138b03a546ec926ef50a31506c3#nodealpine to understand why libc6-compat might be needed.
RUN apt update && apt install sudo -y
WORKDIR /


COPY install.sh /
COPY Chameleon/main.czco /usr/local/bin/chameleon

USER root
RUN sudo apt upgrade && sudo apt install perl python3 whiptail net-tools -y
RUN cat /install.sh | tr -d "\r" > /install.sh
RUN chmod u+x /install.sh && /install.sh -i

EXPOSE 6721

ENV PORT 6721



CMD ["bash", "chameleon", "dockerresult-lnt-pleasedontusethis"]