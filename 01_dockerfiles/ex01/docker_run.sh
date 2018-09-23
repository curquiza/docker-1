#!/bin/bash

docker run -d --rm \
	--name ts3 \
	-p 9987:9987/udp \
	-p 10011:10011 \
	-p 30033:30033 \
	ts3:$1

# Then, in Teamspeak Cient, connect to the server with ip of virtual machine
# and use the privileged key (docker log ts3)
