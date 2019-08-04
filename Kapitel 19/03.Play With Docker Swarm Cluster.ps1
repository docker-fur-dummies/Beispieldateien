#============================================================================
#	Datei:		02.Play With Docker Swarm Cluster.ps1
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
# 1. Den Swarm initialisieren
#----------------------------------------------------------------------------
docker swarm init --advertise-addr <IP-Adresse von node1>

#----------------------------------------------------------------------------
# 2. Knoten 2 zum Manager-Knoten befördern
#----------------------------------------------------------------------------
docker node update --role manager node2

#----------------------------------------------------------------------------
# 3. Befehl zum Hinzufügen eines Managers herausfinden
#----------------------------------------------------------------------------
docker swarm-join-token manager

#----------------------------------------------------------------------------
# 4. Service in Swarm erzeugen
#----------------------------------------------------------------------------
docker service create --replicas 3 nginx 

#----------------------------------------------------------------------------
# 5. Knoten im Cluster anzeigen lassen
#----------------------------------------------------------------------------
docker node ls 

#----------------------------------------------------------------------------
# 5. Services im Cluster anzeigen lassen
#----------------------------------------------------------------------------
docker service ls 

#----------------------------------------------------------------------------
# 6. Tasks auf dem aktuellen Knoten anzeigen
#----------------------------------------------------------------------------
docker node ps 

#----------------------------------------------------------------------------
# 7. Tasks auf dem Knoten node2 anzeigen
#----------------------------------------------------------------------------
docker node ps node2 

#----------------------------------------------------------------------------
# 8. Tasks zu einem Service anzeigen
#----------------------------------------------------------------------------
docker service ps <Name des Service> 

