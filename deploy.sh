#!/bin/bash

node=$1

if [[ $node = "" ]]; then
    echo "Please enter node name"
    exit
fi

# nats-streaming dir
echo "=====> cteate dir..."
mkdir -p /usr/local/nats/nats-streaming
mkdir -p /var/log/nats/nats-streaming/server
mkdir -p /var/log/nats/nats-streaming/cluster
mkdir -p /var/local/nats/nats-streaming
echo "=====> dir cteated"

# dir authorize
echo "=====> dir authorize..."
chown -R daemon:daemon /usr/local/nats/
chown -R daemon:daemon /var/log/nats/
chown -R daemon:daemon /var/local/nats/
echo "=====> dir authorized"
# copy bin file
echo "=====> copy bin file..."
cp nats-streaming-server-v0.15.1-linux-amd64/nats-streaming-server \
    /usr/local/nats/nats-streaming/
echo "=====> bin file copied"

# copy config
echo "=====> copy config file..."
if [ $node = "a" ]; then
    cp nats-streaming-a.conf /usr/local/nats/nats-streaming/nats-streaming.conf
elif [ $node = "b" ]; then
    cp nats-streaming-b.conf /usr/local/nats/nats-streaming/nats-streaming.conf
elif [ $node = "c" ]; then
    cp nats-streaming-c.conf /usr/local/nats/nats-streaming/nats-streaming.conf
fi
echo "=====> config file copied"

# create service
echo "=====> create service..."
cp nats-streaming.service /lib/systemd/system
systemctl daemon-reload
systemctl enable nats-streaming
systemctl start nats-streaming
echo "=====> service created..."
