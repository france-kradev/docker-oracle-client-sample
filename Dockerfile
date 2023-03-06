FROM node:18.7.0 AS base

ARG GIT_HEAD
ENV GIT_HEAD $GIT_HEAD

WORKDIR /tmp
RUN apt-get update && apt-get -y upgrade && apt-get -y dist-upgrade && apt-get install -y alien libaio1
RUN wget https://yum.oracle.com/repo/OracleLinux/OL7/oracle/instantclient/x86_64/getPackage/oracle-instantclient19.3-basiclite-19.3.0.0.0-1.x86_64.rpm
RUN alien -i --scripts oracle-instantclient*.rpm
RUN rm -f oracle-instantclient19.3*.rpm && apt-get -y autoremove && apt-get -y clean

WORKDIR /usr/src/app
COPY package.json package-lock.json ./

# PM2
RUN npm install pm2 -g
RUN rm -rf .npmrc
ENV NODE_PATH=/usr/src/app
ENV NODE_ENV production
EXPOSE 8080
CMD pm2-runtime 'npm run db-check'
