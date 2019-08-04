#============================================================================
#	Datei:		01. Wordpress per Hand.ps1
#
#	Summary:	In diesem Script finden Sie die Befehle aus dem
#               dem Kapitel zu Wordpress Entwicklungsumgebung    
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
# 1. MySQL Image laden
#----------------------------------------------------------------------------
docker image pull mysql:5.7 

#----------------------------------------------------------------------------
# 2. Volume erzeugen
#----------------------------------------------------------------------------
docker volume create mysql_data

#----------------------------------------------------------------------------
# 3. Netzwerk erstellen
#----------------------------------------------------------------------------
docker network create wordpress

#----------------------------------------------------------------------------
# 4. Datenbank Container erstellen
#----------------------------------------------------------------------------
docker container run -d --name mysql -e MYSQL_ROOT_PASSWORD=wordpress -e MYSQL_DATABASE=wordpress -e MYSQL_USER=wordpress -e MYSQL_PASSWORD=wordpress --network wordpress -v mysql_data:/var/lib/mysql mysql:5.7

#----------------------------------------------------------------------------
# 5. Docker Container anschauen
#----------------------------------------------------------------------------
docker container ps 

#----------------------------------------------------------------------------
# 5. Logs des Datenbankcontainers anschauen
#----------------------------------------------------------------------------
docker container logs mysql 

#----------------------------------------------------------------------------
# 6. Wordpress Image herunterladen
#----------------------------------------------------------------------------
docker image pull wordpress

#----------------------------------------------------------------------------
# 7. Wordpress Container erzeugen
#----------------------------------------------------------------------------
docker container run -v C:\wordpress:/var/www -d -e WORDPRESS_DB_HOST=mysql:3306 -e WORDPRESS_DB_USER=wordpress -e WORDPRESS_DB_PASSWORD=wordpress -e WORDPRESS_DB_NAME=wordpress --link mysql:mysql --network wordpress -p 80:80 wordpress:latest

#----------------------------------------------------------------------------
# 8. Container überprüfen
#----------------------------------------------------------------------------
docker container ps 

#----------------------------------------------------------------------------
# 9. Logs des Wordpress Containers anschauen
#----------------------------------------------------------------------------
docker container logs wordpress

#----------------------------------------------------------------------------
# 10. Container anhalten
#----------------------------------------------------------------------------
docker container stop wordpress mysql 

#----------------------------------------------------------------------------
# 11. Container entfernen
#----------------------------------------------------------------------------
docker container rm wordpress mysql

#----------------------------------------------------------------------------
# 12. Image entfernen
#----------------------------------------------------------------------------
docker image rm wordpress mysql 

#----------------------------------------------------------------------------
# 13. Volume und Netzwerk löschen
#----------------------------------------------------------------------------
docker volume delete mysql_data
docker network delete wordpress


