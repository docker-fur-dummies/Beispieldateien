#============================================================================
#	Datei:		03. Docker Registry mit Bind Mounts.ps1
#
#	Summary:	In diesem Script finden Sie die Befehle aus dem
#               dem Kapitel zu Docker Registry. 
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
# 1. Registry Container anhalten
#----------------------------------------------------------------------------
docker container kill registry

#----------------------------------------------------------------------------
# 2. Docker Container Registry löschen
#----------------------------------------------------------------------------
docker container rm registry

#----------------------------------------------------------------------------
# 3. Neue Registry erstellen    
#----------------------------------------------------------------------------
docker container run -d -p 5000:5000 --name registry -v C:/Docker:/var/lib/registry registry

#----------------------------------------------------------------------------
# 4. Image auf die lokale Registry hochladen
#----------------------------------------------------------------------------
docker push 127.0.0.1:5000/wise_whale 

#----------------------------------------------------------------------------
# 5. Übersicht über das Verzeichnis anzeigen
#----------------------------------------------------------------------------
tree D:\docker\docker\registry\v2