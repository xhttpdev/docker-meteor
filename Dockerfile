FROM ubuntu:14.04

RUN apt-get -yqq update
RUN DEBIAN_FRONTEND=noninteractive apt-get -yqq install curl vim
RUN apt-get autoclean

RUN mkdir /app

RUN curl https://install.meteor.com/ | sh

VOLUME ["/packages"]

ENV PACKAGE_DIRS /packages

WORKDIR /app

ONBUILD ADD . /app

EXPOSE 3000

CMD [ "meteor" ]
