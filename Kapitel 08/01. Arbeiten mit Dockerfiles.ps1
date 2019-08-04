#============================================================================
#	Datei:		01. Arbeiten mit Dockerfiles.ps1
#
#	Summary:	In diesem Script finden Sie die Befehle aus dem
#               dem Kapitel zu Dockerfiles. 
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
# 1. Whalesay Image ausprobieren
#----------------------------------------------------------------------------
docker container run docker/whalesay cowsay boo

#----------------------------------------------------------------------------
# 2. Verzeichnis für das Image anlegen
#----------------------------------------------------------------------------
mkdir wise-whale
Set-Location wise-whale

#----------------------------------------------------------------------------
# 3. Aus dem Dockerfile ein Image erzeugen
#----------------------------------------------------------------------------
docker build -t wise-whale .

#----------------------------------------------------------------------------
# 4. Prüfen ob das Image existiert
#----------------------------------------------------------------------------
docker images

#----------------------------------------------------------------------------
# 5. Einen Container aus dem neuen Image erstellen
#----------------------------------------------------------------------------
docker run wise-whale

#----------------------------------------------------------------------------
# 6. mydbimage erzeugen
#----------------------------------------------------------------------------
docker build -t mydbimage .

#----------------------------------------------------------------------------
# 7. Einen Container aus dem neuen Image erstellen
#----------------------------------------------------------------------------
docker run --name mydbcontainer -d -p 1433:1433 -v sqlvolume:/var/opt/mssql mydbimage 



