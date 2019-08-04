FROM microsoft/aspnetcore-build:1.1 AS build-env
WORKDIR /app

COPY *.csproj ./
RUN dotnet restore
COPY . ./
RUN dotnet publish -c Release -o out

FROM microsoft/aspnetcore:1.1 
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet","MvcMovie.dll"]
