#============================================================================
#	Datei:		03. Docker Machine erzeugen.ps1
#
#	Summary:	In diesem Script finden Sie den Befehl, mit dem man die Docker
#               virtual Machine erstellen kann.
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
# 1. Eine neue Docker Machine erzeugen.
#    ACHTUNG! Sie müssen die beiden folgenden Ausdrücke durch eigene Werte
#    ersetzen:
#       - <Name des virtuellen Switches>
#       - <Name der Maschine>
#----------------------------------------------------------------------------
docker-machine create -d hyperv --hyperv-virtual-switch "<Name des virtuellen Switches>" "<Name der Maschine>"