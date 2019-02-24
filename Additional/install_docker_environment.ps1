#============================================================================
#	Datei:		install_docker_environment.ps1
#
#	Summary:	Dieses Script installiert all die Programme mit Chocolately
#               die man benötigt um mit Docker zu arbeiten.
#
#	Datum:		2019-02-16
#
#	PowerShell Version: 5.1
#   Azure Version: 5.1.1
#
#   ACHTUNG: Wenn man dieses Scipt in Visual Studio Code ausführt hängt sich die
#            Ausführung immer dann auf, wenn AzureVM-Befehle ausgeführt werden!
#------------------------------------------------------------------------------
#	Geschrieben von 
#       Dr. Benjamin Kettner, ML!PA Consulting GmbH 
#       Frank Geisler, GDS Business Intelligence GmbH
#============================================================================

#--------------------------------------------------------------------------
# 01 - Chocolately installieren
# -------------------------------------------------------------------------
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#--------------------------------------------------------------------------
# 02 - Chrome installieren
# -------------------------------------------------------------------------
choco install googlechrome -y

#--------------------------------------------------------------------------
# 03 - Docker installieren
# -------------------------------------------------------------------------
choco install docker-desktop -y

#--------------------------------------------------------------------------
# 03 - Visual Studio Code installieren
# -------------------------------------------------------------------------
choco install vscode -y

#--------------------------------------------------------------------------
# 04 - Visual Studio Code Extension für Docker installieren
# -------------------------------------------------------------------------
choco install vscode-docker -y

#--------------------------------------------------------------------------
# 05 - Visual Studio Code Extension GitLens installieren
# -------------------------------------------------------------------------
choco install vscode-gitlens -y

#--------------------------------------------------------------------------
# 06 - GitKraken installieren
# -------------------------------------------------------------------------
choco install gitkraken -y

#--------------------------------------------------------------------------
# 07 - git installieren
# -------------------------------------------------------------------------
choco install git