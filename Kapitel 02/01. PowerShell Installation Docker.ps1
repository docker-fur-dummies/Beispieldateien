#============================================================================
#	Datei:		01. PowerShell Installation Docker.ps1
#
#	Summary:	Dieses Script zeigt, wie Docker mit Hilfe der PowerShell unter
#               Windows installiert wird.
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
# 1. DockerMSFTProvider über Nuget installieren
#----------------------------------------------------------------------------
Install-Module `
    -Name DockerMsftProvider `
    -Repository PSGallery `
    -Force 

#----------------------------------------------------------------------------
# 2. Das Paket Docker installieren
#----------------------------------------------------------------------------    
Install-Package `
    -Name docker `
    -ProviderName DockerMsftProvider  
    
#----------------------------------------------------------------------------
# 3. Computer neu starten
#----------------------------------------------------------------------------
Restart-Computer `
    -Force

#----------------------------------------------------------------------------
# 4. Nachsehen ob Docker ausgeführt wird
#----------------------------------------------------------------------------
docker version

