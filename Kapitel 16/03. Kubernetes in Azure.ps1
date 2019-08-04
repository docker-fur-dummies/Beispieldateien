#============================================================================
#	Datei:		02. Kubernetes in Azure
#
#	Summary:	In diesem Script finden Sie die Befehle aus dem
#               dem Kapitel zu Azure, um mit Kubernetes zu arbeiten. 
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
az group create --name dummiesaks --location westeurope

#----------------------------------------------------------------------------
# 2. AKS Cluster erstellen
#----------------------------------------------------------------------------
az aks create --resource-group dummiesaks --name dummiesakscluster --node-count 3 --enable-addons monitoring --generate-ssh-keys

#----------------------------------------------------------------------------
# 3. Kontext für AKS Cluster setzen
#----------------------------------------------------------------------------
az aks get-credentials --resouce-group dummiesaks --name dummiesakscluster

#----------------------------------------------------------------------------
# 4. Cluster-Knoten anzeigen
#----------------------------------------------------------------------------
kubectl get nodes

#----------------------------------------------------------------------------
# 5. Das azure-vote Skript auf dem Cluster ausführen
#----------------------------------------------------------------------------
kubectl apply -f azure-vote.yaml

#----------------------------------------------------------------------------
# 6. Umgebung überprüfen
#----------------------------------------------------------------------------
kubectl get service

#----------------------------------------------------------------------------
# 7. Umgebung regelmäßig prüfen
#----------------------------------------------------------------------------
kubectl get service --watch

#----------------------------------------------------------------------------
# 8. Befehle für den AKS Cluster installieren
#----------------------------------------------------------------------------
az aks install-cli

#----------------------------------------------------------------------------
# 9. Subscirpiton auswählen
#----------------------------------------------------------------------------
az account set --subscription <Name Ihrer Subscription>

#----------------------------------------------------------------------------
# 10. Lokalen Proxy für das Kubernetes Dashboard aufsetzen
#----------------------------------------------------------------------------
az aks browse --resource-group dummiesaks --name dummiesakscluster

#----------------------------------------------------------------------------
# 11. Ressource Gruppe (und ihre Inhalte) wieder löschen
#----------------------------------------------------------------------------
az group delete --name dummiesaks --yes --no-wait 

