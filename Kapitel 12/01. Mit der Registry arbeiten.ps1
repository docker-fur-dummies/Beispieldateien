#============================================================================
#	Datei:		01. Mit der Registry arbeiten.ps1
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
# 1. Beim Docker Hub anmelden
#----------------------------------------------------------------------------
docker login

#----------------------------------------------------------------------------
# 2. Ein neues Image erstellen
#----------------------------------------------------------------------------
docker image build -t <IhrName>/wise_whale . 

#----------------------------------------------------------------------------
# 3. Die Docker Images überprüfen
#----------------------------------------------------------------------------
docker image ls

#----------------------------------------------------------------------------
# 4. Einen neuen Container auf Basis des Images erzeugen
#----------------------------------------------------------------------------
docker container run <IhrName>/wise_whale

#----------------------------------------------------------------------------
# 5. Image auf Docker Hub hochladen
#----------------------------------------------------------------------------
docker image push <IhrName>/wise_whale

#----------------------------------------------------------------------------
# 6. Berscreibung
#----------------------------------------------------------------------------

