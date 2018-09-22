FROM debian

# otherwise ts3 doesn't start
ENV TS3SERVER_LICENSE="accept"
# or add `-e TS3SERVER_LICENSE="accept"` when docker run

RUN useradd ts3
WORKDIR /home/ts3

# download, unzip and clean
RUN apt-get update && apt-get install -y wget bzip2 \
	&& wget http://dl.4players.de/ts/releases/3.4.0/teamspeak3-server_linux_amd64-3.4.0.tar.bz2 \
	&& tar -xjvf teamspeak3-server_linux_amd64-3.4.0.tar.bz2 \
	&& rm teamspeak3-server_linux_amd64-3.4.0.tar.bz2

# TCP if not specified
EXPOSE 9987/udp
EXPOSE 30033
EXPOSE 10011

USER ts3

# Container runs as an executable
ENTRYPOINT ["sh", "teamspeak3-server_linux_amd64/ts3server_minimal_runscript.sh"]

# Check the log with `docker logs <container_name>`
