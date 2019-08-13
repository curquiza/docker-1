FROM	kalilinux/kali-linux-docker

RUN		apt update -y && \
		apt upgrade -y && \
		apt install -y dirb nmap ftp ssh vim gcc squashfs-tools

# $> docker build -t boot2root .
# $> docker run -it --rm boot2root bash

# Kali linux is a linux distribution mainly used for hacking
# Kali usecase for Boot2Root:
# $> nmap <ip-char>