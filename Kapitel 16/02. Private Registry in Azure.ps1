#============================================================================
#	Datei:		02. Private Registry in Azure
#
#	Summary:	In diesem Script finden Sie die Befehle aus dem
#               dem Kapitel zu Azure, um eine private Registry aufzubauen. 
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
az group create --name dummiesregistry --location westeurope 

#----------------------------------------------------------------------------
# 2. Registry erstellen
#----------------------------------------------------------------------------
az acr create --resource-group dummiesregistry --name dummiescontainerregistry --sku basic --admin-enabled

#----------------------------------------------------------------------------
# 3. Bei der Registry anmelden
#----------------------------------------------------------------------------
docker login dummiescontainerregistry.azurecr.io

#----------------------------------------------------------------------------
# 4. Ein Image für die nächsten Schritte herunterladen
#----------------------------------------------------------------------------
docker pull docker/whalesay 

#----------------------------------------------------------------------------
# 5. Image für die private Registry taggen
#----------------------------------------------------------------------------
docker tag docker/whalesay dummiescontainerregistry.azurecr.io/whalesayfordummies:v1

#----------------------------------------------------------------------------
# 6. Image in die private Registry pushen
#----------------------------------------------------------------------------
docker push dummiescontainerregistry.azurecr.io/whalesayfordummies:v1

#----------------------------------------------------------------------------
# 7. Die lokale Kopie des Images löschen
#----------------------------------------------------------------------------
docker image rm dummiescontainerregistry.azurecr.io/whalesayfordummies:v1

#----------------------------------------------------------------------------
# 8. Die Images in der Registry auflisten
#----------------------------------------------------------------------------
az acr repository list --name dummiescontainerregistry --output table

#----------------------------------------------------------------------------
# 9. Image aus der Registry ziehen und ausführen
#----------------------------------------------------------------------------
docker container run dummiescontainerregistry.azurecr.io/whalesayfordummies:v1 cowsay Dummies

#----------------------------------------------------------------------------
# 10. Die Ressourcen Gruppe und alle darin enthaltenen Elemente wieder löschen
#----------------------------------------------------------------------------
az group delete --name dummiesregistry

