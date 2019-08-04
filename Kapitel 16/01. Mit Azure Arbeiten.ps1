#============================================================================
#	Datei:		01. Mit Azure Arbeiten.ps1
#
#	Summary:	In diesem Script finden Sie die grundlegenden Befehle aus dem
#               dem Kapitel zu Azure. 
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
# 1. Ressource Gruppe erstellen
#----------------------------------------------------------------------------
az group create --name dockerfuerdummies --location westeurope

#----------------------------------------------------------------------------
# 2. Container in Azure erstellen
#----------------------------------------------------------------------------
az container create --resource-group dockerfuerdummies --name helloworld --image microsoft/aci-helloworld --dns-name helloworld-demo --ports 80

#----------------------------------------------------------------------------
# 3. Informationen zum Container anzeigen
#----------------------------------------------------------------------------
az container show --resource-group dockerfuerdummies --name helloworld --query "{FQND:ipAddress.fqdn,ProvisioningState:provisioningState}" --out table

#----------------------------------------------------------------------------
# 4. Logs des Containers anzeigen
#----------------------------------------------------------------------------
az container logs --resource-group dockerfuerdummies --name helloworld 

#----------------------------------------------------------------------------
# 5. Den Container wieder löschen
#----------------------------------------------------------------------------
az container delete --resource-group dockerfuerdummies --name helloworld

#----------------------------------------------------------------------------
# 6. Ressource Gruppe wieder löschen
#----------------------------------------------------------------------------
az group delete --name dockerfuerdummies
