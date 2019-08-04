#============================================================================
#	Datei:		01. Mit Docker Compose arbeiten.ps1
#
#	Summary:	In diesem Script finden Sie die Befehle aus dem
#               dem Kapitel zu Docker Compose. 
#
#	Datum:		2019-08-04
#
#   Revisionen: yyyy-dd-mm
#                   - ...
#
#	Projekt:	Docker für Dummies
#
#	PowerShell Version: 5.1
#------------------------------------------------------------------------------
#	Geschrieben von 
#       Frank Geisler, GDS Business Intelligence GmbH
#       Dr. Benjamin Kettner, ML!PA Consulting GmbH
#
#   Dieses Script ist nur zu Lehr- bzw. Lernzwecken gedacht
#
#   DIESER CODE UND DIE ENTHALTENEN INFORMATIONEN WERDEN OHNE GEWÄHR JEGLICHER
#   ART ZUR VERFÜGUNG GESTELLT, WEDER AUSDRÜCKLICH NOCH IMPLIZIT, EINSCHLIESSLICH,
#   ABER NICHT BESCHRÄNKT AUF FUNKTIONALITÄT ODER EIGNUNG FÜR EINEN BESTIMMTEN
#   ZWECK. SIE VERWENDEN DEN CODE AUF EIGENE GEFAHR.
#============================================================================*/

#----------------------------------------------------------------------------
# 1. SQL Server Container starten
#----------------------------------------------------------------------------
docker run -d -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=!demo54321"  microsoft/mssql-server-linux:latest

#----------------------------------------------------------------------------
# 2. Verzeichnis für das Projekt anlegen
#----------------------------------------------------------------------------
mkdir composetest
cd composetest

#----------------------------------------------------------------------------
# 3. Umgebung mit Docker Compose starten
#----------------------------------------------------------------------------
docker-compose up 

#----------------------------------------------------------------------------
# 4. Container anschauen
#----------------------------------------------------------------------------
docker container ls

#----------------------------------------------------------------------------
# 5. Images anschauen
#----------------------------------------------------------------------------
docker Images

#----------------------------------------------------------------------------
# 6. Eine Verzeichnisstruktur anlegen
#----------------------------------------------------------------------------
mkdir docker-fullstack-web
cd docker-fullstack-web
mkdir react-app
mkdir util
cd util

#----------------------------------------------------------------------------
# 7. Ein Image erzeugen
#----------------------------------------------------------------------------
docker build --build-arg APPNAME=whale-app -t reactcreate .

#----------------------------------------------------------------------------
# 8. Container auf Basis des Images starten
#----------------------------------------------------------------------------
docker run --mount type=bind,source=~/docker-fullstack-web/react-app,target=/react -e APPNAME=whale-app reactcreate

#----------------------------------------------------------------------------
# 9. Image mit dem entsprechenden Build-Argument erzeugen
#----------------------------------------------------------------------------
docker build --build-arg APPNAME=whale-app  -t frontend-app  .

#----------------------------------------------------------------------------
# 10. Container starten und das Verzeichnis einbinden
#----------------------------------------------------------------------------
docker run -it --mount type=bind,source=$(PWD)/whale-app,target=/usr/src/app -v /usr/src/app/node-modules -p 3000:3000 --rm frontend-app

#----------------------------------------------------------------------------
# 11. Docker Compose mit Build Flag
#----------------------------------------------------------------------------
docker-compose up --build

#----------------------------------------------------------------------------
# 12. Verzeichnis für Backend Anwendung anlegen
#----------------------------------------------------------------------------
mkdir backend-app
cd backend-app

#----------------------------------------------------------------------------
# 13. Image erstellen
#----------------------------------------------------------------------------
docker build -t backendcontainer .

#----------------------------------------------------------------------------
# 14. Container starten
#----------------------------------------------------------------------------
docker run -it --rm -p 5000:5000 backendcontainer


