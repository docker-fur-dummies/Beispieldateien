#============================================================================
#	Datei:		01. Mit Netzwerken spielen.ps1
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
# 1. Netzwerke anzeigen
#----------------------------------------------------------------------------
docker network ls 

#----------------------------------------------------------------------------
# 2. Netzwerk inspizieren
#----------------------------------------------------------------------------
docker network inspect 

#----------------------------------------------------------------------------
# 3. Hilfe zu Docker Network Create anzeigen
#----------------------------------------------------------------------------
docker network create --help 

#----------------------------------------------------------------------------
# 4. Docker Netzwerk anlegen
#----------------------------------------------------------------------------
docker network create my_new_network 

#----------------------------------------------------------------------------
# 5. Netzwerke noch einmal anzeigen lassen
#----------------------------------------------------------------------------
docker network ls 

#----------------------------------------------------------------------------
# 6. Informationen zum neuen Netzwerk anzeigen lassen
#----------------------------------------------------------------------------
docker network inspect my_new_network

#----------------------------------------------------------------------------
# 7. Container im Netzwerk anlegen
#----------------------------------------------------------------------------
docker container run -d --name nginx –network my_new_network nginx 

#----------------------------------------------------------------------------
# 8. Container anzeigen
#----------------------------------------------------------------------------
docker container ls 

#----------------------------------------------------------------------------
# 9. Konfiguration des Containers überprüfen
#----------------------------------------------------------------------------
docker container inspect nginx

#----------------------------------------------------------------------------
# 10. Container mit anderem Netzwerk verbinden
#----------------------------------------------------------------------------
docker network connect bridge nginx 

#----------------------------------------------------------------------------
# 11. Konfiguration des Containers überprüfen
#----------------------------------------------------------------------------
docker container inspect nginx 

#----------------------------------------------------------------------------
# 12. Container aus Netzwerk entfernen
#----------------------------------------------------------------------------
docker network disconnect my_new_network nginx 

#----------------------------------------------------------------------------
# 13. Konfiguration des Containers überprüfen
#----------------------------------------------------------------------------
docker container inspect nginx 