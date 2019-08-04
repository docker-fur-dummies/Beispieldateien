#============================================================================
#	Datei:		01. SQL Server in Docker.ps1
#
#	Summary:	In diesem Script finden Sie die grundlegenden Befehle aus dem
#               dem Kapitel zum SQL Server in Docker. 
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
# 1. Microsoft Images im Docker Hub suchen
#----------------------------------------------------------------------------
docker search microsoft 

#----------------------------------------------------------------------------
# 2. SQL Server Image herunterladen
#----------------------------------------------------------------------------
docker pull microsoft/mssql-server-linux

#----------------------------------------------------------------------------
# 3. Einen Container mit dem SQL Server Image instanziieren
#----------------------------------------------------------------------------
docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=!test123" -p 1433:1433 --name slq1 -d microsoft/mssql-server-linux

#----------------------------------------------------------------------------
# 4. Laufende Container anzeigen
#----------------------------------------------------------------------------
docker container ls 

#----------------------------------------------------------------------------
# 5. Adventure Works in den Container kopieren
#----------------------------------------------------------------------------
docker cp c:\Temp\AdventureWorksLT2012_Data.mdf sql1:/var/opt/mssql/data/AdventureWorksLT2012_Data.mdf

#----------------------------------------------------------------------------
# 6. SQL Server mit eingebundenem Volume erzeugen
#----------------------------------------------------------------------------
docker run --name sqlserverdocker -p 1433:1433 -v sqlvolume:/var/opt/mssql  -d  frankgeisler/mssql-server-linux-adventureworks2017

#----------------------------------------------------------------------------
# 7. Den Container wieder löschen
#----------------------------------------------------------------------------
docker container rm sqlserverdocker -f

#----------------------------------------------------------------------------
# 8. Vorschau-Version des SQL Server mit demselben eingebundenem Volume erzeugen
#----------------------------------------------------------------------------
docker run --name sqlserverdocker -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=!demo54321"  -p 1433:1433 -v sqlvolume:/var/opt/mssql -d mcr.microsoft.com/mssql/server:vNext-CTP2.0-ubuntu

#----------------------------------------------------------------------------
# 9. Logs des Containers überprüfen
#----------------------------------------------------------------------------
docker container logs sqlserverdocker