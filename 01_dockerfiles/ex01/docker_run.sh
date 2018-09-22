#!/bin/bash

docker run -d \
	-d \
	--name ts3 \
	-p 9987:9987/udp \
	-p 10011:10011 \
	-p 30033:30033 \
	-e TS3SERVER_LICENSE='accept' \
	ts3:$1

#--volumes-from ts3-data \
