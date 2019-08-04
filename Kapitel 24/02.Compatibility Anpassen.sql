/*============================================================================
 *	Datei:		02.Compatibility Anpassen.sql
 *
 *	Summary:	In diesem Script finden Sie die grundlegenden Befehle aus dem
 *               dem Kapitel zum SQL Server in Docker. 
 *
 *	Datum:		2019-08-04
 *
 *   Revisionen: yyyy-dd-mm
 *                   - ...
 *
 *	Projekt:	Docker für Dummies
 *
 *	PowerShell Version: 5.1
 *------------------------------------------------------------------------------
 *	Geschrieben von 
 *       Frank Geisler, GDS Business Intelligence GmbH
 *       Dr. Benjamin Kettner, ML!PA Consulting GmbH
 *
 *   Dieses Script ist nur zu Lehr- bzw. Lernzwecken gedacht
 *
 *   DIESER CODE UND DIE ENTHALTENEN INFORMATIONEN WERDEN OHNE GEWÄHR JEGLICHER
 *   ART ZUR VERFÜGUNG GESTELLT, WEDER AUSDRÜCKLICH NOCH IMPLIZIT, EINSCHLIESSLICH,
 *   ABER NICHT BESCHRÄNKT AUF FUNKTIONALITÄT ODER EIGNUNG FÜR EINEN BESTIMMTEN
 *   ZWECK. SIE VERWENDEN DEN CODE AUF EIGENE GEFAHR.
 *============================================================================*/

SELECT compatibility_level
FROM sys.databases
WHERE name = 'AdventureWorks2017';
GO

ALTER DATABASE AdventureWorks2017 SET COMPATIBILITY_LEVEL = 150;
GO
