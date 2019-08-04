#============================================================================
#	Datei:		01. Mit Swarm Arbeiten.ps1
#
#	Summary:	In diesem Script finden Sie die grundlegenden Befehle aus dem
#               dem Kapitel zu Docker Swarm. 
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
# 1. Die Docker Umgebung analysieren
#----------------------------------------------------------------------------
docker info

#----------------------------------------------------------------------------
# 2. Swarm Modus aktivieren
#----------------------------------------------------------------------------
docker swarm init

#----------------------------------------------------------------------------
# 3. Den Befehl für das Hinzufügen eines Managers zum Swarm anzeigen
#----------------------------------------------------------------------------
docker swarm join-token manager 

#----------------------------------------------------------------------------
# 4. Den Befehl für das Hinzufügen eines Workers zum Swarm anzeigen
#----------------------------------------------------------------------------
docker swarm join-token worker 

#----------------------------------------------------------------------------
# 5. Den Status der Knoten anzeigen
#----------------------------------------------------------------------------
docker node ls

#----------------------------------------------------------------------------
# 6. Auf dem Swarm verfügbare Befehle anzeigen
#----------------------------------------------------------------------------
docker node command

#----------------------------------------------------------------------------
# 7. Einen Service erstellen
#----------------------------------------------------------------------------
docker service create nginx

#----------------------------------------------------------------------------
# 8. Laufende Services anzeigen
#----------------------------------------------------------------------------
docker service ls 

#----------------------------------------------------------------------------
# 9. Zum Service gehörende Prozesse anzeigen
#----------------------------------------------------------------------------
docker service ps <Service ID>

#----------------------------------------------------------------------------
# 10. Replikas für einen Service erzeugen
#----------------------------------------------------------------------------
docker service update <Service ID> --replicas 3

#----------------------------------------------------------------------------
# 11. Laufende Container prüfen
#----------------------------------------------------------------------------
docker container ls 

#----------------------------------------------------------------------------
# 12. Einen der zum Service gehörenden Container löschen
#----------------------------------------------------------------------------
docker container rm -f <Container ID>

#----------------------------------------------------------------------------
# 13. Den Service wieder löschen
#----------------------------------------------------------------------------
docker service rm <Service ID>

