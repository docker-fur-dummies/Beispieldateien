#============================================================================
#	Datei:		01. RaspberryPi.sh
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
# 1. Docker installieren mit dem Convenience Script
#----------------------------------------------------------------------------
curl -sSL https://get.docker.com | sh 

#----------------------------------------------------------------------------
# 2. Docker beim Systemstart automatisch Starten
#----------------------------------------------------------------------------
sudo systemctl enable docker 

#----------------------------------------------------------------------------
# 3. Den user pi zur Docker-Gruppe hinzufügen
#----------------------------------------------------------------------------
sudo usermod -aG docker pi 

#----------------------------------------------------------------------------
# 4. Docker-Installation testen
#----------------------------------------------------------------------------
docker version 

#----------------------------------------------------------------------------
# 5. Den nginx Container starten
#----------------------------------------------------------------------------
docker container run -d -p 80:80 nginx 

#----------------------------------------------------------------------------
# 6. Laufende Container anzeigen
#----------------------------------------------------------------------------
docker container ls 

