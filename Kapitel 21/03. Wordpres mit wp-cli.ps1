#============================================================================
#	Datei:		02. Wordpress mit Docker-Compose.ps1
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
# 1. Image erzeugen
#----------------------------------------------------------------------------
docker image build -t wordpress-custom . 

#----------------------------------------------------------------------------
# 2. Image überprüfen
#----------------------------------------------------------------------------
docker image ls 

#----------------------------------------------------------------------------
# 3. Altes Image entfernen
#----------------------------------------------------------------------------
docker image rm wordpress-custom 

#----------------------------------------------------------------------------
# 4. Prüfen ob das Image weg ist
#----------------------------------------------------------------------------
docker image ls 

#----------------------------------------------------------------------------
# 5. Umgebung mit Docker Compose up bereitstellen   
#----------------------------------------------------------------------------
docker-compose up -d 

#----------------------------------------------------------------------------
# 6. Befehl im Docker Container ausführen      
#----------------------------------------------------------------------------
docker-compose exec wordpress wp core version 

#----------------------------------------------------------------------------
# 7. Docker Compose über Komandozeile konfigurieren
#----------------------------------------------------------------------------
docker-compose exec wordpress wp core install --url=http://localhost --title="Docker für Dummies" --admin_user=admin --admin_password=password --admin_email=someone@somewhere.net.

#----------------------------------------------------------------------------
# 8. Umgebung wieder anhalten
#----------------------------------------------------------------------------
docker-compose stop 

#----------------------------------------------------------------------------
# 9. Umgebung entfernen
#----------------------------------------------------------------------------
docker-compose rm

