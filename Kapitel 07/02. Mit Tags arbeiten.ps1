#============================================================================
#	Datei:		01. Mit Tags arbeiten.ps1
#
#	Summary:	In diesem Script finden Sie die Befehle aus dem
#               Kapitel zum Docker Hub. 
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
# 1. Das Image mit dem gewünschten Tag laden
#----------------------------------------------------------------------------
docker pull ubuntu:trusty

#----------------------------------------------------------------------------
# 2. Aus dem Image einen Container erstellen    
#----------------------------------------------------------------------------
docker run -t -d --name trusty_test ubuntu:trusty

#----------------------------------------------------------------------------
# 3. Prüfen ob der Container läuft
#----------------------------------------------------------------------------
docker container ps

#----------------------------------------------------------------------------
# 4. Prüfen ob das Ubuntu im Container die richtige Version
#    hat.
#----------------------------------------------------------------------------
docker exec -it trusty_test /bin/bash

#----------------------------------------------------------------------------
# 5. Prüfen ob Sie auf einem Linux-System sind (das Prompt sollte
#    sich geändert haben)
#----------------------------------------------------------------------------
uname -a

#----------------------------------------------------------------------------
# 6. Die Ubuntu-Version prüfen
#----------------------------------------------------------------------------
cat /etc/issue

#----------------------------------------------------------------------------
# 7. Nochmal dieselben Schritte ausführen aber ohne Tag
#----------------------------------------------------------------------------
docker pull ubuntu
docker run -t -d --name trusty_test ubuntu
docker container ps
docker exec -it trusty_test /bin/bash
uname -a
cat /etc/issue