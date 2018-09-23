FROM ruby:2.4-jessie

WORKDIR /opt/app/

ADD Dockerfile_given .
ADD blog/ .

RUN apt-get -y update \
	&& apt-get install sqlite3 \
	&& gem install rails \
	&& gem install bundler \
	&& bundle install \
	&& rails db:migrate

# run l'autre dockerfile
# rails db:create ?
# rails db:seed -> faire un seed.rb
