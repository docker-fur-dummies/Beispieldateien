#============================================================================
#	Datei:		01. Docker Machine erstellen.ps1
#
#	Summary:	In diesem Script finden Sie den Befehl, mit dem Sie eine
#               Docker Machine für die Docker Toolbox erstellen können. Dann
#               wird geprüft ob die Docker Toolbox läuft. 
#
#	Datum:		2019-08-04
#
#   Revisionen: yyyy-dd-mm
#                   - ...
#	Kunde:	    Kunde
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
# 1. Standard Docker Machine erstellen
#----------------------------------------------------------------------------
docker-machine create default 

#----------------------------------------------------------------------------
# 2. Gucken ob Docker läuft
#----------------------------------------------------------------------------
docker version

#----------------------------------------------------------------------------
# 3. Einen einfachen Container erstellen
#----------------------------------------------------------------------------
docker run hello-world 