FROM ruby:2.4-jessie

RUN apt-get -y update \
	&& apt-get install sqlite3 \
	&& gem install rails

ADD blog/ /opt/app

ONBUILD WORKDIR /opt/app/

ONBUILD RUN bundle install \
	&& rails db:migrate db:seed

# Build ft-rails:on-build image :
# docker build . -t ft-rails:on-build

# Build image from the Dockerfile-son :
# docker build -f Dockerfile-son -t ft-rails:running

# Run container :
# docker run -d -p 3000:3000 -name=first-rails-app ft-rails:running
