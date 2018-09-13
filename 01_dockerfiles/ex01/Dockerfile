FROM debian

ENV TS3SERVER_LICENSE="accept"

RUN apt-get update && apt-get install -y wget bzip2 \
	&& wget http://dl.4players.de/ts/releases/3.4.0/teamspeak3-server_linux_amd64-3.4.0.tar.bz2 \
	&& tar -xjvf teamspeak3-server_linux_amd64-3.4.0.tar.bz2 \


# sh teamspeak3-server_linux_amd64/ts3server_minimal_runscript.sh
