#!/bin/bash

node=$1

if [[ $node = "" ]]; then
    echo "Please enter node name"
    exit
fi

# add user:group nats:nats
adduser --system --group --no-create-home --shell /bin/false nats

# nats-streaming dir
mkdir -p /usr/local/nats/nats-streaming
mkdir -p /var/log/nats/nats-streaming/server
mkdir -p /var/log/nats/nats-streaming/cluster
mkdir -p /var/local/nats/nats-streaming
mkdir -p /var/run/nats

# nats policy
chown -R nats:nats /usr/local/nats/
chown -R nats:nats /var/log/nats/
chown -R nats:nats /var/local/nats/
chown -R nats:nats /var/run/nats

# get bin file
wget https://github.com/nats-io/nats-streaming-server/releases/download/v0.15.1/nats-streaming-server-v0.15.1-linux-amd64.zip
unzip nats-streaming-server-v0.15.1-linux-amd64.zip
cp nats-streaming-server-v0.15.1-linux-amd64/nats-streaming-server \
    /usr/local/nats/nats-streaming/

# copy config
if [ $node = "a" ]; then
    cp nats-streaming-a.conf /usr/local/nats/nats-streaming/
elif [ $node = "b" ]; then
    cp nats-streaming-b.conf /usr/local/nats/nats-streaming/
elif [ $node = "c" ]; then
    cp nats-streaming-c.conf /usr/local/nats/nats-streaming/
fi

# create service
cp nats-streaming.service /lib/systemd/system
systemctl daemon-reload
systemctl enable nats-streaming
systemctl start nats-streaming
