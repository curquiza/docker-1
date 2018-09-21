FROM debian

# ENV TS3SERVER_LICENSE="accept" # needed for Teamspeak

#RUN useradd ts3
#USER ts3 # maybe not necesary
# ? mkdir /home/ts3 ?
#WORKDIR=/home/ts3

# download, unzip, clean go inside the dir
RUN apt-get update && apt-get install -y wget bzip2 \
	&& wget http://dl.4players.de/ts/releases/3.4.0/teamspeak3-server_linux_amd64-3.4.0.tar.bz2 \
	&& tar -xjvf teamspeak3-server_linux_amd64-3.4.0.tar.bz2 \
	&& rm teamspeak3-server_linux_amd64-3.4.0.tar.bz2
#	&& cd teamspeak3-server_linux_amd64

#EXPOSE 9987/udp
#EXPOSE 30033
#EXPOSE 10011

#VOLUME ts3-data:/home/ts3/data #maybe not necesary

# sh teamspeak3-server_linux_amd64/ts3server_minimal_runscript.sh
#./ts3server_startscript.sh start

#CMD ["echo", "server started"]

# faire tourner le contenainer
# tester sur le navigateur ou en CLI pour envoyer des messages
# essayer d'enlever les ports et de les déclarer au run
# see the log : docker log <container_name>
