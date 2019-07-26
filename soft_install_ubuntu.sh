#!/bin/bash

echo "apt installing..."
apt update
apt install -y unzip
echo "apt install done"

# install nats-streaming
echo "nats-streaming downloading..."
wget https://github.com/nats-io/nats-streaming-server/releases/download/v0.15.1/nats-streaming-server-v0.15.1-linux-amd64.zip
unzip nats-streaming-server-v0.15.1-linux-amd64.zip
echo "nats-streaming downloaded"
