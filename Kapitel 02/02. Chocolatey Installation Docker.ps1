#============================================================================
#	Datei:		02. Chocolatey Installation Docker.ps1
#
#	Summary:	Dieses Script zeigt wie man Docker mittels Chocolatey 
#               (https://chocolatey.org/) installiert
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
# 1. Chocolatey installieren
#----------------------------------------------------------------------------
Set-ExecutionPolicy `
    -ExecutionPolicy Bypass `
    -Scope Process `
    -Force
    
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')) 

#----------------------------------------------------------------------------
# 2. Docker installieren
#----------------------------------------------------------------------------
choco install docker-desktop --pre

#----------------------------------------------------------------------------
# 3. Docker mit Chocolatey aktualisieren
#----------------------------------------------------------------------------
choco upgrade docker-desktop --pre