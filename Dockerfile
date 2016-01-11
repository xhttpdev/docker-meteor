FROM node:0.10.41

RUN apt-get -yqq update
RUN DEBIAN_FRONTEND=noninteractive apt-get -yqq install curl vim g++ make
RUN apt-get autoclean

RUN mkdir /app

RUN curl https://install.meteor.com/ | sh

VOLUME ["/packages"]
ENV PACKAGE_DIRS /packages
ENV ROOT_URL http://localhost
ENV PORT 3000

ONBUILD ADD . /sourcecode
ONBUILD RUN cd /sourcecode; meteor build /meteor-app
ONBUILD RUN cd /meteor-app; tar -zxf sourcecode.tar.gz
ONBUILD RUN cd /meteor-app/bundle/programs/server; npm install

EXPOSE 3000

CMD [ "node", "/meteor-app/bundle/main.js" ]
