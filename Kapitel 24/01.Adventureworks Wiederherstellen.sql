/*============================================================================
 *	Datei:		01.Adventureworks Wiederherstellen.sql
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

CREATE DATABASE [AdventureWorksLT2012] ON 
(FILENAME=N'/var/opt/mssql/data/AdventureWorksLT2012_Data.mdf') FOR ATTACH;
