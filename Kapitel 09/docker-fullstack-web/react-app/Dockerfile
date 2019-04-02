FROM node:9.6.1
ARG APPNAME 

RUN mkdir /usr/src/app
WORKDIR /usr/src/app
ENV PATH /usr/src/app/node_modules/.bin:$PATH
	
COPY $APPNAME/package.json /usr/src/app/package.json
RUN npm install
RUN npm install react-scripts@1.1.1 -g 
	
CMD ["npm", "start"] 
