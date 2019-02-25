#============================================================================
#	Datei:		open_firewall_ports.ps1
#
#	Summary:	Dieses Script öffnet die Firewall-Ports die die Hosts zur
#               Kommunikation miteinander benötigen.
#
#	Datum:		2019-02-25
#
#	PowerShell Version: 5.1
#------------------------------------------------------------------------------
#	Geschrieben von 
#       Dr. Benjamin Kettner, ML!PA Consulting GmbH 
#       Frank Geisler, GDS Business Intelligence GmbH
#============================================================================

#--------------------------------------------------------------------------
# 01 - cluster management communications
# -------------------------------------------------------------------------
New-NetFirewallRule `
    -DisplayName 'Docker Swarm - cluster management communications' `
    -Profile @('Domain', 'Private') `
    -Direction Inbound `
    -Action Allow `
    -Protocol TCP `
    -LocalPort @('2377')

#--------------------------------------------------------------------------
# 02 - communication among nodes - TCP
# -------------------------------------------------------------------------
New-NetFirewallRule `
    -DisplayName 'Docker Swarm - communication among nodes - TCP' `
    -Profile @('Domain', 'Private') `
    -Direction Inbound `
    -Action Allow `
    -Protocol TCP `
    -LocalPort @('7946')

#--------------------------------------------------------------------------
# 03 - communication among nodes - UDP
# -------------------------------------------------------------------------
New-NetFirewallRule `
    -DisplayName 'Docker Swarm - communication among nodes - UDP' `
    -Profile @('Domain', 'Private') `
    -Direction Inbound `
    -Action Allow `
    -Protocol UDP `
    -LocalPort @('7946')

#--------------------------------------------------------------------------
# 04 - overlay network traffic
# -------------------------------------------------------------------------
New-NetFirewallRule `
    -DisplayName 'Docker Swarm - overlay network traffic' `
    -Profile @('Domain', 'Private') `
    -Direction Inbound `
    -Action Allow `
    -Protocol UDP `
    -LocalPort @('4789')