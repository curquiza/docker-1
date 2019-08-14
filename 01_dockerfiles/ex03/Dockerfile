FROM debian:9.8

ENV DEBIAN_FRONTEND=noninteractive

ARG IP="localhost"

EXPOSE 443
EXPOSE 22

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y curl openssh-server ca-certificates git
    # apt-get install -y curl openssh-server ca-certificates git tzdata

# Fecth GitLab repo with debian script
RUN curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | bash

# Install Gitlab
# RUN apt-get update -y && apt-get install -y --no-install-recommends gitlab-ce
RUN apt-get install -y gitlab-ce

# SSL Certificate
RUN mkdir -p /etc/gitlab/ssl && chmod 700 /etc/gitlab/ssl \
    && openssl req -new -x509 -nodes -newkey rsa:2048 -keyout /etc/gitlab/ssl/gitlab.key -out /etc/gitlab/ssl/gitlab.crt -days 365 -subj /CN=${IP} && \
	sed -i -e "s|^\(external_url\) .*$|\1 'https://${IP}'|" \
	-e "s|^# \(nginx\['ssl_certificate'\] = \"/etc/gitlab/ssl\)/.*$|\1/gitlab.crt\"|" \
	-e "s|^# \(nginx\['ssl_certificate_key'\] = \"/etc/gitlab/ssl\)/.*$|\1/gitlab.key\"|" \
	-e "s|^# \(gitlab_rails\['gitlab_shell_ssh_port'\] = 22\)$|\1|" \
    /etc/gitlab/gitlab.rb

# ENTRYPOINT service ssh start && (/opt/gitlab/embedded/bin/runsvdir-start &) && gitlab-ctl reconfigure && gitlab-ctl tail

# $> docker build -t ex03 .
# $> docker run -it --rm -p 8000:443 -p 8022:22 --privileged ex03 bash