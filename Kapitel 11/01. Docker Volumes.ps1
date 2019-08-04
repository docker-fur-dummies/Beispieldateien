#============================================================================
#	Datei:		01. Docker Volumes.ps1
#
#	Summary:	In diesem Script finden Sie die Befehle aus dem
#               dem Kapitel zur Persistenz. 
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
# 1. Docker Container mit PostgeSQL erzeugen
#----------------------------------------------------------------------------
docker container run -d --name psql -v psql:/var/lib/postgesql/data postgres:9.6.1

#----------------------------------------------------------------------------
# 2. Die Log Dateien des Docker Containers anschauen
#----------------------------------------------------------------------------
docker container logs -f psql 

#----------------------------------------------------------------------------
# 3. Den Docker Container anhalten
#----------------------------------------------------------------------------
docker container stop psql 

#----------------------------------------------------------------------------
# 4. Einen Container mit einer neuen PostgreSQL Version
#    erstellen.
#----------------------------------------------------------------------------
docker container run -d --name psql2 -v psql:/var/lib/postgresql/data postgres:9.6.2

#----------------------------------------------------------------------------
# 5. Docker Container überprüfen
#----------------------------------------------------------------------------
docker container ls -a 

#----------------------------------------------------------------------------
# 6. Docker Volume anzeigen
#----------------------------------------------------------------------------
docker volume ls 

#----------------------------------------------------------------------------
# 7. Log Datei des zweiten Containers anzeigen
#----------------------------------------------------------------------------
docker container logs psql2 