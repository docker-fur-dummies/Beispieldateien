#============================================================================
#	Datei:		01. Mit dem Docker Hub arbeiten.ps1
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
# 1. Nach Ubuntu Images suchen
#----------------------------------------------------------------------------
docker search ubuntu

#----------------------------------------------------------------------------
# 2. Vollständige Beschreibung anzeigen lassen
#----------------------------------------------------------------------------
docker search ubuntu --no-trunc

#----------------------------------------------------------------------------
# 3. Hilfe zu Docker Search anzeigen lassen
#----------------------------------------------------------------------------
docker search --help

#----------------------------------------------------------------------------
# 4. Ubuntu Tags in PowerShell auslesen
#----------------------------------------------------------------------------
$ResultingObject = @()
$result = Invoke-WebRequest `
            -Uri "https://registry.hub.docker.com/v2/repositories/library/ubuntu/tags/?page_size=1250"
$JsonObject = ConvertFrom-Json `
                -InputObject $result.Content
$ResultingObject = $JsonObject.results                
Write-Output $ResultingObject.name 