FROM node:0.10
MAINTAINER Mike Lambert <lambert8@illinois.edu>

# Install make / nodejs
RUN apt-get -qq update && \
    apt-get -qq install gcc g++ build-essential nodejs npm && \
    ln -s /usr/bin/nodejs /usr/bin/node && \
    apt-get -y clean all && \
    rm -rf /var/lib/apt/lists/* /tmp/*

# Install node dependencies
WORKDIR /cloud9
COPY package.json /cloud9
RUN npm install

VOLUME /workspace
EXPOSE 3131
CMD [ "bin/cloud9.sh", "-w", "/workspace", "-l", "0.0.0.0", "--username", "admin", "--password", "password", "-p", "3131" ]


COPY . /cloud9

