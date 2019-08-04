#============================================================================
#	Datei:		01. Windows Container Dienst.ps1
#
#	Summary:	In diesem Script finden Sie die Befehle aus dem
#               dem Kapitel zu Windows Container Dienst. 
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
# 1. Verzeichnis Demoapp erzeugen
#----------------------------------------------------------------------------
mkdir demoapp

#----------------------------------------------------------------------------
# 2. Repo per git clone klonen
#----------------------------------------------------------------------------
cd demoapp 
git clone https://github.com/cwilhit/SampleASPContainerApp.git

#----------------------------------------------------------------------------
# 3. In den Ordner der Beispielapp wechseln und Inhalt anzeigen
#----------------------------------------------------------------------------
cd \SampleASPContainerApp\
dir

#----------------------------------------------------------------------------
# 4. Ein neues Dockerfile erstellen
#----------------------------------------------------------------------------
New-Item Dockerfile -type file

#----------------------------------------------------------------------------
# 5. Dockerfile mit Visual Studio Code öffnen
#----------------------------------------------------------------------------
code dockerfile

#----------------------------------------------------------------------------
# 6. Build auf dem Dockerfile
#----------------------------------------------------------------------------
docker build -t myapp .

#----------------------------------------------------------------------------
# 7. Einen Container aus dem Dockerfile erzeugen
#----------------------------------------------------------------------------
docker run -d -p 80:80 --name myapp myapp 

#----------------------------------------------------------------------------
# 8. Den Docker Container untersuchen
#----------------------------------------------------------------------------
docker container inspect myapp 





