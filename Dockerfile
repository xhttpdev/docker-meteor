FROM node:0.10.43

ENV ROOT_URL http://localhost
ENV PORT 3000

RUN apt-get -yqq update \
    && DEBIAN_FRONTEND=noninteractive apt-get -yqq install curl g++ make \
    && apt-get autoclean

RUN curl https://install.meteor.com/ | sh \
    && mkdir -p /app/sourcecode \
    && mkdir -p /app/meteor-app

ONBUILD ADD . /app/sourcecode
ONBUILD RUN cd /app/sourcecode \
            && meteor build --directory /app/meteor-app \
            && cd /app/meteor-app/bundle/programs/server \
            && npm install \
            && rm -rf /app/sourcecode

EXPOSE 3000

CMD [ "node", "/app/meteor-app/bundle/main.js" ]
