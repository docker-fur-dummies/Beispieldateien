#============================================================================
#	Datei:		kapitel_24_script_02.ps1
#
#	Summary:	Dieses Script demonstriert wie man ein Wordpress Image
#               anpassen kann. 
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
# 1. Das angepasste Image bauen
#----------------------------------------------------------------------------
docker image build -t wordpress-custom .

#----------------------------------------------------------------------------
# 2. Das angepasste Image anzeigen
#----------------------------------------------------------------------------
docker image ls 

#----------------------------------------------------------------------------
# 3. Das angepasste Image wieder entfernen. Es soll über die docker-compose
#    Datei erzeugt werden. 
#----------------------------------------------------------------------------
docker image rm wordpress-custom

#----------------------------------------------------------------------------
# 4. Überprüfen, dass das Image gelöscht ist. 
#----------------------------------------------------------------------------
docker image ls

#----------------------------------------------------------------------------
# 5. Die Umgebung mit docker-compose hochfahren
#----------------------------------------------------------------------------
docker-compose up -d

#----------------------------------------------------------------------------
# 6. Version des Wordpress ermitteln
#----------------------------------------------------------------------------
docker-compose exec wordpress wp core version 

#----------------------------------------------------------------------------
# 7. Wordpress über Kommandozeile konfigurieren
#----------------------------------------------------------------------------
docker-compose exec wordpress wp core install --url=http://localhost --title=“Docker für Dummies“ --admin_user=admin --admin_password=password --admin_email=someone@somewhere.net

#----------------------------------------------------------------------------
# 8. Die Umgebung wieder beenden
#----------------------------------------------------------------------------
docker-compose stop 

#----------------------------------------------------------------------------
# 9. Alle Container wieder entfernen
#----------------------------------------------------------------------------
docker-compose rm  