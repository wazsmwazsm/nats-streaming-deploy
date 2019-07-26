#!/bin/bash

yum update
yum install -y unzip

# install nats-streaming
wget https://github.com/nats-io/nats-streaming-server/releases/download/v0.15.1/nats-streaming-server-v0.15.1-linux-amd64.zip
unzip nats-streaming-server-v0.15.1-linux-amd64.zip
