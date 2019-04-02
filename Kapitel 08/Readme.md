# Erste eigene Dockerfiles

Hier finden Sie den Quellcode der Dockerfiles aus Kapitel 8. 

## Wise whale
Um das Docker image aus dem wise-whale Dockerfile zu erstellen, wechseln Sie in das wise-whale Verzeichnis und führen Sie den folgenden Befehl aus: 
```
docker build -t wise-whale .
```
Das Image instanziieren Sie dann über 
```
docker run wise-whale
```

## Whale DB
Um das Docker image aus dem whale-db Dockerfile zu erstellen, wechseln Sie in das whale-db Verzeichnis und führen Sie den folgenden Befehl aus: 
```
docker build -t mydbimage .
``` 
Das Image starten Sie dann über 
```
docker run --name mydbcontainer -d -p 1433:1433 -v sqlvolume:/var/opt/mssql mydbimage 
```