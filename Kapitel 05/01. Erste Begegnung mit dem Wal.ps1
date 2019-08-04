#============================================================================
#	Datei:		01. Erste Begegnung mit dem Wal.ps1
#
#	Summary:	In diesem Script sind die ersten Docker-Befehle aus
#               Kapitel 5 zusammengefasst
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
# 1. Docker Version ausgeben
#----------------------------------------------------------------------------
docker Version

#----------------------------------------------------------------------------
# 2. nginx Image herunterladen
#----------------------------------------------------------------------------
docker image pull nginx

#----------------------------------------------------------------------------
# 3. Container auf Basis des nginx Images erzeugen
#----------------------------------------------------------------------------
docker container run -d --name nginx-test -p 8080:80 nginx

#----------------------------------------------------------------------------
# 4. Container auflisten
#----------------------------------------------------------------------------
docker container ps

#----------------------------------------------------------------------------
# 5. Container beenden
#----------------------------------------------------------------------------
docker container stop nginx-test

#----------------------------------------------------------------------------
# 6. Container entfernen
#----------------------------------------------------------------------------
docker container rm nginx-test

#----------------------------------------------------------------------------
# 7. nginx Image entfernen
#----------------------------------------------------------------------------
docker image rm nginx 