#============================================================================
#	Datei:		02.Lokaler Swarm Cluster.ps1
#
#	Summary:	In diesem Script finden Sie die grundlegenden Befehle aus dem
#               dem Kapitel zu Docker Swarm. 
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
# 1. Eine neue Docker Machine erstellen
#----------------------------------------------------------------------------
docker-machine create -d hyperv --hyperv-virtual-switch vswitch node1

#----------------------------------------------------------------------------
# 2. Mit der Docker Machine verbinden
#----------------------------------------------------------------------------
docker-machine ssh node1 

#----------------------------------------------------------------------------
# 3. Zwei weitere Docker Machines verbinden
#----------------------------------------------------------------------------
docker-machine create -d hyperv --hyperv-virtual-switch vswitch node2 
docker-machine create -d hyperv --hyperv-virtual-switch vswitch node3

#----------------------------------------------------------------------------
# 4. Einstellungen der Docker Machine ansehen
#----------------------------------------------------------------------------
docker-machine env node1

#----------------------------------------------------------------------------
# 5. Umgebung für die neue Docker Machine aufsetzen
#----------------------------------------------------------------------------
&"C:\Program Files\Docker\Docker\Resources\bin\docker-machine.exe" env node1 | Invoke-Expression

#----------------------------------------------------------------------------
# 6. Docker-Umgebung prüfen
#----------------------------------------------------------------------------
docker info 

#----------------------------------------------------------------------------
# 7. Aktive Docker Machine herausfinden
#----------------------------------------------------------------------------
docker-machine ls 


