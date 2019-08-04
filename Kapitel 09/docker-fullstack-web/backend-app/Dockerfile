from microsoft/dotnet:2.2.103-sdk-alpine3.8

RUN mkdir /app
WORKDIR /app

RUN apk add git && apk add bash
RUN git clone https://github.com/graphql-dotnet/examples/
WORKDIR /app/examples/src/AspNetCore

ENV ASPNETCORE_URLS http://*:5000
EXPOSE 5000

ADD launchSettings.json ./Example/Properties/

CMD ./run.sh
