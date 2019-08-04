#============================================================================
#	Datei:		02. Eine eigene Registry bauen.ps1
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
# 1. Container mit der lokalen Registry erstellen
#----------------------------------------------------------------------------
docker container run -d -p 5000:5000 --name registry registry 

#----------------------------------------------------------------------------
# 2. Schauen ob der Container läuft
#----------------------------------------------------------------------------
docker pull frankgeisler/wise_whale 

#----------------------------------------------------------------------------
# 3. Das Image neu taggen
#----------------------------------------------------------------------------
docker tag <Ihr Name>/wise_whale 127.0.0.1:5000/wise_whale

#----------------------------------------------------------------------------
# 4. Image überprüfen
#----------------------------------------------------------------------------
docker images ls

#----------------------------------------------------------------------------
# 5. Image auf die eigene Registry hochladen
#----------------------------------------------------------------------------
docker push 127.0.0.1:5000/wise_whale

#----------------------------------------------------------------------------
# 6. lokale Images löschen
#----------------------------------------------------------------------------
docker image rm 127.0.0.1:5000/wise_whale 
docker image rm frankgeisler/wise_whale

#----------------------------------------------------------------------------
# 7. Prüfen das die Images nicht mehr lokal gespeichert sind
#----------------------------------------------------------------------------
docker image ls 

#----------------------------------------------------------------------------
# 8. Image aus der lokalen Registry wieder herunterladen
#----------------------------------------------------------------------------
docker pull 127.0.0.1:5000/wise_whale:latest

#----------------------------------------------------------------------------
# 9. Images überprüfen
#----------------------------------------------------------------------------
docker image ls 

#----------------------------------------------------------------------------
# 10. Neuen Container aus dem Image erstellen
#----------------------------------------------------------------------------
docker container run 127.0.0.1:5000/wise_whale 

