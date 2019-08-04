#============================================================================
#	Datei:		03. DNS Server prüfen.ps1
#
#	Summary:	In diesem Script finden Sie die Befehle aus dem
#               dem Kapitel zu Docker Netzwerken. 
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
# 1. Einen Docker Container erstellen
#----------------------------------------------------------------------------
docker container run -d --name web nginx

#----------------------------------------------------------------------------
# 2. Docker Container überprüfen
#----------------------------------------------------------------------------
docker container ls

#----------------------------------------------------------------------------
# 3. DNS-Namensauflösung ausprobieren
#----------------------------------------------------------------------------
docker container run --rm alpine nslookup web
