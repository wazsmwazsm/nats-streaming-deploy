#!/bin/bash

echo "Nats-streaming purge..."
# stop serve
read -r -p "Stop serve? [Y/n] " input
case $input in
    [yY][eE][sS]|[yY])
		kill -TERM `cat /usr/local/nats/nats-streaming/var/run/nats-streaming.pid`
		echo "=====> serve stoped"
		;;

    [nN][oO]|[nN])
		exit # must stop server if you want to take the next step
       	;;

    *)
		echo "Invalid input..."
		exit 1
		;;
esac

# rm dir
read -r -p "Delete all file? [Y/n] " input
case $input in
    [yY][eE][sS]|[yY])
		rm -rf /usr/local/nats/nats-streaming
		rm -rf /var/log/nats/nats-streaming
		rm -rf /var/local/nats/nats-streaming
		rm -f /var/run/nats-streaming.pid
		echo "=====> file deleted"
		;;

    [nN][oO]|[nN])
		echo "=====> file not delete"
       	;;

    *)
		echo "Invalid input..."
		exit 1
		;;
esac

# rm service
read -r -p "Delete service? [Y/n] " input
case $input in
    [yY][eE][sS]|[yY])
		rm -f /etc/systemd/system/multi-user.target.wants/nats-streaming.service
		rm -f /lib/systemd/system/nats-streaming.service
		systemctl daemon-reload
		echo "=====> service deleted"
		;;

    [nN][oO]|[nN])
		echo "=====> service not delete"
       	;;

    *)
		echo "Invalid input..."
		exit 1
		;;
esac
