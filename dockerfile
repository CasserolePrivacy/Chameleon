FROM debian:latest

# Install dependencies only when needed
# Check https://github.com/nodejs/docker-node/tree/b4117f9333da4138b03a546ec926ef50a31506c3#nodealpine to understand why libc6-compat might be needed.
RUN apt update && apt install sudo -y
WORKDIR /app


COPY . .

USER root

RUN curl -fsSL https://raw.githubusercontent.com/NateYeet/Chameleon/main/install.sh | tr -d "\r" > /app/install.sh
RUN chmod u+x ./install.sh && /app/install.sh -i

EXPOSE 6721

ENV PORT 6721



CMD ["/bin/chameleon", "dockerresult-lnt-pleasedontusethis"]