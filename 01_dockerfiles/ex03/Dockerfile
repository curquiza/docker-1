FROM debian:9.8

ENV DEBIAN_FRONTEND=noninteractive

# ARG IP="0.0.0.0"

EXPOSE 443
EXPOSE 22
EXPOSE 80

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y curl openssh-server ca-certificates git
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Fecth GitLab repo with debian script and install gitlab-ce
RUN curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | bash && \
    apt-get install -y gitlab-ce
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Gitlab
# RUN apt-get update -y && apt-get install -y --no-install-recommends gitlab-ce
# RUN apt-get install -y gitlab-ce

# SSL Certificate - Self signed
RUN mkdir -p /etc/gitlab/ssl && chmod +x /etc/gitlab/ssl \
    && openssl req -new -x509 -nodes -newkey rsa:2048 -keyout /etc/gitlab/ssl/gitlab.key -out /etc/gitlab/ssl/gitlab.crt -days 365 -subj /C=FR/ST=Paris/L=Paris/O=42/OU=0/CN=192.168.99.100/emailAddress=curquiza@student.42.fr \
    && echo "external_url \"https://192.168.99.100\"" >> /etc/gitlab/gitlab.rb \
    && echo "nginx['redirect_http_to_https'] = true" >> /etc/gitlab/gitlab.rb \
    && echo "nginx['ssl_certificate'] = \"/etc/gitlab/ssl/selfsigned.crt\"" >> /etc/gitlab/gitlab.rb \
    && echo "nginx['ssl_certificate_key'] = \"/etc/gitlab/ssl/selfsigned.key\"" >> /etc/gitlab/gitlab.rb \
    && echo "gitlab_rails['gitlab_shell_ssh_port'] = 8022" >> /etc/gitlab/gitlab.rb

ENTRYPOINT service ssh start && (/opt/gitlab/embedded/bin/runsvdir-start &) && gitlab-ctl reconfigure && gitlab-ctl tail

# $> docker build -t ex03 --build-arg IP=$(docker-machine ip Char) .
# $> docker run -it --rm -p 80:80 -p 8022:22 -p 443:443 --privileged ex03

# Tests :
# 1) got to https://$(docker-machine ip Char):8000

# 2) HTTPS :
# clone : env GIT_SSL_NO_VERIFY=true git clone https://$(docker-machine ip Char):8000/root/<repo>.git
# push : env GIT_SSL_NO_VERIFY=true git push origin master

# 3) SSH :
# clone :
# push :