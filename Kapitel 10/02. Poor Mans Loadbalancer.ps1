#============================================================================
#	Datei:		02. Poor Mans Load Balancer.ps1
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
# 1. Neues Netzwerk erstellen
#----------------------------------------------------------------------------
docker network create round_robin 

#----------------------------------------------------------------------------
# 2. 4 Container im Netzwerk erzeugen
#----------------------------------------------------------------------------
docker container run -d --network round_robin --net-alias web nginx 
docker container run -d --network round_robin --net-alias web nginx 
docker container run -d --network round_robin --net-alias web nginx 
docker container run -d --network round_robin --net-alias web nginx 

#----------------------------------------------------------------------------
# 3. Die weiteren drei Container erzeugen
#----------------------------------------------------------------------------
docker container run --network round_robin --rm alpine nslookup web 

#----------------------------------------------------------------------------
# 4. Befehl mehrfach ausprobieren
#----------------------------------------------------------------------------
docker container run --network round_robin --rm alpine nslookup web 
docker container run --network round_robin --rm alpine nslookup web 
docker container run --network round_robin --rm alpine nslookup web 
docker container run --network round_robin --rm alpine nslookup web 
docker container run --network round_robin --rm alpine nslookup web 