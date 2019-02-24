#============================================================================
#	Datei:		kapitel_24_script_01.ps1
#
#	Summary:	Dieses Script demonstriert wie man eine Wordpress Entwicklungs-
#               umgebung manuell mit Hilfe von Docker aufbauen kann. 
#
#	Datum:		2019-02-24
#
#	PowerShell Version: 5.1
#   Docker Version: 18.09.2
#------------------------------------------------------------------------------
#	Geschrieben von 
#       Dr. Benjamin Kettner, ML!PA Consulting GmbH 
#       Frank Geisler, GDS Business Intelligence GmbH
#
#   Dieses Script ist nur zu Lehr- bzw. Lernzwecken gedacht und wird im Buch
#   Docker für Dummies vorgestellt.
#  
#   DIESER CODE UND DIE ENTHALTENEN INFORMATIONEN WERDEN OHNE GEWÄHR JEGLICHER 
#   ART ZUR VERFÜGUNG GESTELLT, WEDER AUSDRÜCKLICH NOCH IMPLIZIT, EINSCHLIESSLICH, 
#   ABER NICHT BESCHRÄNKT AUF FUNKTIONALITÄT ODER EIGNUNG FÜR EINEN BESTIMMTEN 
#   ZWECK. SIE VERWENDEN DEN CODE AUF EIGENE GEFAHR.
#============================================================================*/

#----------------------------------------------------------------------------
# 1. Image von mysql Version 5.7 herunterladen
#----------------------------------------------------------------------------
docker image pull mysql:5.7

#----------------------------------------------------------------------------
# 2. Volume mysql_data erstellen
#----------------------------------------------------------------------------
docker volume create mysql_data

#----------------------------------------------------------------------------
# 3. Netzwerk "wordpress" erstellen
#----------------------------------------------------------------------------
docker network create wordpress

#----------------------------------------------------------------------------
# 4. Docker Container mit MySQL Datenbank erstellen
#----------------------------------------------------------------------------
docker container run -d --name mysql -e MYSQL_ROOT_PASSWORD=wordpress -e MYSQL_DATABASE=wordpress -e MYSQL_USER=wordpress -e MYSQL_PASSWORD=wordpress --network wordpress -v mysql_data:/var/lib/mysql mysql:5.7

#----------------------------------------------------------------------------
# 5. Nachsehen, ob der MySQL Docker Container läuft
#----------------------------------------------------------------------------
docker container ps

#----------------------------------------------------------------------------
# 6. Logs des MySQL Docker Containers anschauen
#----------------------------------------------------------------------------
docker container logs mysql

#----------------------------------------------------------------------------
# 7. Docker Container mit Wordpress erzeugen
#----------------------------------------------------------------------------
docker container run -v C:\wordpress:/var/www -d -e WORDPRESS_DB_HOST=mysql:3306 -e WORDPRESS_DB_USER=wordpress -e WORDPRESS_DB_PASSWORD=wordpress -e WORDPRESS_DB_NAME=wordpress --link mysql:mysql --network wordpress --name wordpress -p 80:80 wordpress:latest

#----------------------------------------------------------------------------
# 8. Nachsehen, ob der Wordpress Docker Container läuft
#----------------------------------------------------------------------------
docker container ps

#----------------------------------------------------------------------------
# 9. Logs des Wordpress Containers anzeigen
#----------------------------------------------------------------------------
docker container logs wordpress 

#----------------------------------------------------------------------------
# 10. Docker Container stoppen
#----------------------------------------------------------------------------
docker container stop wordpress mysql

#----------------------------------------------------------------------------
# 11. Docker Container löschen
#----------------------------------------------------------------------------
docker container rm wordpress mysql

#----------------------------------------------------------------------------
# 12. Docker Images löschen
#----------------------------------------------------------------------------
docker image rm wordpress mysql:5.7 

#----------------------------------------------------------------------------
# 13. Docker Volume mysql_db löschen
#----------------------------------------------------------------------------
docker volume rm mysql_data

#----------------------------------------------------------------------------
# 14. Docker Netzwerk löschen
#----------------------------------------------------------------------------
docker network rm wordpress
