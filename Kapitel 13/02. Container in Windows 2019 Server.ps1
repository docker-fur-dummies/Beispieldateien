#============================================================================
#	Datei:		02. Container in Windows 2019 Server.ps1
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
# 1. DockerMSftProvider installieren
#----------------------------------------------------------------------------
Install-Module `
    -Name DockerMsftProvider `
    -Repository PSGallery `
    -Force

#----------------------------------------------------------------------------
# 2. Docker installieren
#----------------------------------------------------------------------------
Install-Package `
    -Name docker `
    -ProviderName DockerMsftProvider

#----------------------------------------------------------------------------
# 3. Server neu starten
#----------------------------------------------------------------------------
Restart-Computer 

#----------------------------------------------------------------------------
# 4. Nano-Server Container erzeugen
#    Wenn Sie einen Windows 2016 Server besitzen müssen 
#    Sie statt des Images microsoft/dotnet-samples:dotnetapp-nanoserver-1809 
#    das Image microsoft/dotnet-samples:dotnetapp-nanoserver-sac2016 verwenden.  
#----------------------------------------------------------------------------
docker container run microsoft/dotnet-samples:dotnetapp-nanoserver-1809