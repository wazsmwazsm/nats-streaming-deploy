# Deploy nats-streaming

Make a simple 3 node nats-streaming cluster.

Prepare 3 server, node a, node b, node c.

> All steps below you shold run in each server and run as root.

## install
```bash
chmod +x *.sh
./install_ubuntu.sh # if you in ubuntu
```

> default nats-streaming version: v0.15.1

## change config

change config nats-streaming-(a/b/c).conf for your situation.

## deploy
```bash
./deploy.sh a # in node b , should ./deploy.sh b, as same as c
```

## purge
```bash
./purge.sh
```

## dir

default dir:

- /usr/local/nats/nats-streaming: bin file and config
- /var/local/nats/nats-streaming: nats-streaming store data
- /var/run/nats: pid data 
- /var/log/nats/nats-streaming: nats-streaming server and cluster log

if you want to change these dir, you should modify:
- deploy.sh
- nats-streaming-xx.conf
- nats-streaming.service
- purge.sh
