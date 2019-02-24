#============================================================================
#	Datei:		create_swarm_lab_environment.ps1
#
#	Summary:	Dieses Script implementiert eine Umgebung in der 
#               unter Azure drei VMs für eine Docker Swarm Testumgebung  
#               erzeugt werden
#
#   ToDo:       Das Script sollte so umgeschrieben werden, dass wir eine 
#               Schleife haben, die n Swarm Cluster erzeugt.
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
# 00 - Variablen für das Script. Änderungen sollten nur hier vorgenommen werden
# -------------------------------------------------------------------------
$SubscriptionName = <Name Ihrer Subscription hier>
$resourcegroupName = "swarm"
$location = "UK South"

# Storage
$storageName = <Ihr StorageName hier>
$storageType = "Standard_LRS"

# Netzwerk 
$vnetName = "swarm-vnet"
$subNetName = "default"
$VNetAddressPrefix = "10.0.0.0/16"
$VNetSubnetAddressPrefix = "10.0.0.0/24"

# Betriebssysteme - wir verwenden für alle dasselbe Windows 2016 Image 
$PublisherName = "MicrosoftWindowsServer" 
$Offer = "WindowsServer"
$Sku = "2016-Datacenter" 
$Os_Version = "latest"

# Compute für swarm02
$swarm01_VMName = "swarm01"
$swarm01_VMSize = "Standard_E4s_v3" 
$swarm01_OSDiskName = $swarm01_VMName + "_OSDisk"
$swarm01_InterfaceName = $swarm01_VMName+"_Interface"
$swarm01_PipName = $swarm01_VMName+"_pip"

# Compute für swarm02
$swarm02_VMName = "swarm02"
$swarm02_VMSize = "Standard_E2s_v3" 
$swarm02_OSDiskName = $swarm02_VMName + "_OSDisk"
$swarm02_InterfaceName = $swarm02_VMName+"_Interface"
$swarm02_PipName = $swarm02_VMName+"_pip"

# Compute für swarm03
$swarm03_VMName = "swarm03"
$swarm03_VMSize = "Standard_E2s_v3" 
$swarm03_OSDiskName = $swarm03_VMName + "_OSDisk"
$swarm03_InterfaceName = $swarm03_VMName+"_Interface"
$swarm03_PipName = $swarm03_VMName+"_pip"

#--------------------------------------------------------------------------
# 01 - Anmelden mit dem Benutzerkonto unter Azure das die Sponsored 
#      Subscription hat (fgeisler)
# -------------------------------------------------------------------------
Login-AzureRmAccount

Get-AzureRmSubscription `
   -SubscriptionName $SubscriptionName | Set-AzureRmContext

#--------------------------------------------------------------------------
# 02 - Ressource Gruppe swarm erstellen
# -------------------------------------------------------------------------

New-AzureRmResourceGroup `
    -Name $resourcegroupName `
    -Location $location

#----------------------------------------------------------------------------
# 03 - Storage anlegen
#----------------------------------------------------------------------------
$StorageAccount = New-AzureRmStorageAccount `
                    -ResourceGroupName $resourcegroupName `
                    -Name $storageName `
                    -Type $StorageType `
                    -Location $location

#----------------------------------------------------------------------------
# 04 - VNet anlegen
#----------------------------------------------------------------------------
$SubnetConfig = New-AzureRmVirtualNetworkSubnetConfig `
                -Name $subNetName `
                -AddressPrefix $VNetSubnetAddressPrefix

$vn = New-AzureRmVirtualNetwork `
        -Name $VNetName `
        -ResourceGroupName $ResourceGroupName `
        -Location $Location `
        -AddressPrefix $VNetAddressPrefix `
        -Subnet $SubnetConfig

$vn = Get-AzureRmVirtualNetwork `
        -Name $vnetName `
        -ResourceGroupName $resourcegroupName

#----------------------------------------------------------------------------
# 05 - Allgemeines Credential für die virtuellen Maschinen abfragen. Da 
#      die Maschinen ja eh in die Domäne gehängt werden wird nur einmal das
#      Credential abgefragt und als lokaler Admin verwendet. 
#----------------------------------------------------------------------------
$Credential = Get-Credential

#--------------------------------------------------------------------------
# 06 - virtuelle Maschine swarm01 anlegen
# -------------------------------------------------------------------------

# Public IP-Adresse anlegen 
$swarm01_pip = New-AzureRmPublicIpAddress `
                -Name $swarm01_PipName `
                -ResourceGroupName $resourcegroupName `
                -Location $location `
                -AllocationMethod Dynamic

# Netzwerk-Interface anlegen
$swarm01_Interface = New-AzureRmNetworkInterface `
                        -Name $swarm01_InterfaceName `
                        -ResourceGroupName $resourcegroupName `
                        -Location $location `
                        -SubnetId $vn.Subnets[0].Id `
                        -PublicIpAddressId $swarm01_pip.Id

# Jetzt wird die eigentliche VM angelegt
$swarm01_VmConfig = New-AzureRmVMConfig `
                        -VMName $swarm01_VMName `
                        -VMSize $swarm01_VMSize | `
                        Set-AzureRmVMOperatingSystem `
                            -Windows `
                            -ComputerName $swarm01_VMName `
                            -Credential $Credential | `
                            Add-AzureRmVMNetworkInterface `
                                -Id $swarm01_Interface.Id | `
                                Set-AzureRmVMOSDisk `
                                    -Name $swarm01_OSDiskName `
                                    -CreateOption FromImage | `
                                    Set-AzureRmVMBootDiagnostics `
                                        -Enable `
                                        -ResourceGroupName $resourcegroupName `
                                        -StorageAccountName $storageName ` |
                                        Set-AzureRmVMSourceImage `
                                            -PublisherName $PublisherName `
                                            -Offer $Offer `
                                            -Skus $Sku `
                                            -Version $Os_Version 
                 
# virtuelle Maschine erzeugen
New-AzureRmVM `
    -ResourceGroupName $resourcegroupName `
    -Location $location `
    -VM $swarm01_VmConfig 

#--------------------------------------------------------------------------
# 07 - virtuelle Maschine swarm02 anlegen
# -------------------------------------------------------------------------

# Public IP-Adresse anlegen 
$swarm02_pip = New-AzureRmPublicIpAddress `
                -Name $swarm02_PipName `
                -ResourceGroupName $resourcegroupName `
                -Location $location `
                -AllocationMethod Dynamic

# Netzwerk-Interface anlegen
$swarm02_Interface = New-AzureRmNetworkInterface `
                        -Name $swarm02_InterfaceName `
                        -ResourceGroupName $resourcegroupName `
                        -Location $location `
                        -SubnetId $vn.Subnets[0].Id `
                        -PublicIpAddressId $swarm02_pip.Id

# Jetzt wird die eigentliche VM angelegt
$swarm02_VmConfig = New-AzureRmVMConfig `
                        -VMName $swarm02_VMName `
                        -VMSize $swarm02_VMSize | `
                        Set-AzureRmVMOperatingSystem `
                            -Windows `
                            -ComputerName $swarm02_VMName `
                            -Credential $Credential | `
                            Add-AzureRmVMNetworkInterface `
                                -Id $swarm02_Interface.Id | `
                                Set-AzureRmVMOSDisk `
                                    -Name $swarm02_OSDiskName `
                                    -CreateOption FromImage | `
                                    Set-AzureRmVMBootDiagnostics `
                                        -Enable `
                                        -ResourceGroupName $resourcegroupName `
                                        -StorageAccountName $storageName ` |
                                        Set-AzureRmVMSourceImage `
                                            -PublisherName $PublisherName `
                                            -Offer $Offer `
                                            -Skus $Sku `
                                            -Version $Os_Version 
                 
# virtuelle Maschine erzeugen
New-AzureRmVM `
    -ResourceGroupName $resourcegroupName `
    -Location $location `
    -VM $swarm02_VmConfig 

#--------------------------------------------------------------------------
# 08 - virtuelle Maschine swarm03 anlegen
# -------------------------------------------------------------------------

# Public IP-Adresse anlegen 
$swarm03_pip = New-AzureRmPublicIpAddress `
                -Name $swarm03_PipName `
                -ResourceGroupName $resourcegroupName `
                -Location $location `
                -AllocationMethod Dynamic

# Netzwerk-Interface anlegen
$swarm03_Interface = New-AzureRmNetworkInterface `
                        -Name $swarm03_InterfaceName `
                        -ResourceGroupName $resourcegroupName `
                        -Location $location `
                        -SubnetId $vn.Subnets[0].Id `
                        -PublicIpAddressId $swarm03_pip.Id

# Jetzt wird die eigentliche VM angelegt
$swarm03_VmConfig = New-AzureRmVMConfig `
                        -VMName $swarm03_VMName `
                        -VMSize $swarm03_VMSize | `
                        Set-AzureRmVMOperatingSystem `
                            -Windows `
                            -ComputerName $swarm03_VMName `
                            -Credential $Credential | `
                            Add-AzureRmVMNetworkInterface `
                                -Id $swarm03_Interface.Id | `
                                Set-AzureRmVMOSDisk `
                                    -Name $swarm03_OSDiskName `
                                    -CreateOption FromImage | `
                                    Set-AzureRmVMBootDiagnostics `
                                        -Enable `
                                        -ResourceGroupName $resourcegroupName `
                                        -StorageAccountName $storageName ` |
                                        Set-AzureRmVMSourceImage `
                                            -PublisherName $PublisherName `
                                            -Offer $Offer `
                                            -Skus $Sku `
                                            -Version $Os_Version 
                 
# virtuelle Maschine erzeugen
New-AzureRmVM `
    -ResourceGroupName $resourcegroupName `
    -Location $location `
    -VM $swarm03_VmConfig 