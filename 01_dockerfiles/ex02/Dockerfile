FROM ruby:2.4-jessie

WORKDIR /opt/app/

ADD Dockerfile_given .
ADD blog/ .

RUN apt-get -y update \
	&& apt-get install sqlite3 \
	&& gem install rails \
	&& gem install bundler \
	&& bundle install \
	&& rails db:migrate db:seed

RUN docker build . -f Dockerfile_given -t ft-rails:running \
	&& docker run -d -p 3000:3000 --name=ft-rails-run ft-rails:running

# Run the first Dockerfile :
# docker build . -t ft-rails:on-build
# docker run -d --name ft-rails-build ft-rails:on-build
