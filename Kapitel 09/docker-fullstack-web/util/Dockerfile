FROM node:latest
ENV APPNAME react-app
RUN mkdir /react
VOLUME /react
RUN npm install -g create-react-app
CMD cd /react && create-react-app $APPNAME
