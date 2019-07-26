# Deploy nats-streaming

Create a simple 3 node nats-streaming cluster.

Prepare 3 server, node a, node b, node c.

> All steps below you should run in each server and run as root.

## install
```bash
chmod +x *.sh
./install_ubuntu.sh # if you in ubuntu
```

> default nats-streaming version: v0.15.1

## change config

change config nats-streaming-(a/b/c).conf for your situation.

if you need a daemon user run nats-streaming, do below (example user "nats"):

```bash
# if daemon user exists, skip this step
adduser --system --group --no-create-home --shell /bin/false nats
```
change nats-streaming.service:
```bash
...
User=nats
Group=nats
...
```
change deploy.sh
```bash
...
chown -R nats:nats /usr/local/nats/
chown -R nats:nats /var/log/nats/
chown -R nats:nats /var/local/nats/
chown -R nats:nats /var/run/nats
...
```

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
- purge.sh
- nats-streaming-xx.conf
- nats-streaming.service
