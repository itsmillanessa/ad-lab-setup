<#
.SYNOPSIS
    Configura una IP estática, gateway y DNS en un Windows Server para laboratorios de AD.

.DESCRIPTION
    Este script detecta la primera interfaz de red activa y aplica la configuración de red indicada.

.NOTAS
    Autor: @itsmillan
    Fecha: 2025-07-01
#>

# Detectar interfaces activas
$ifaces = Get-NetAdapter | Where-Object { $_.Status -eq 'Up' }

if ($ifaces.Count -eq 0) {
    Write-Error "No se encontró ninguna interfaz de red activa."
    exit 1
}

$ifaceName = $ifaces[0].Name

# Parámetros de red (modifica aquí si necesitas otro rango)
$ip = "172.16.31.10"
$mask = 24
$gateway = "172.16.31.254"
$dns = "172.16.31.10"

# Asignar IP estática y gateway
New-NetIPAddress -InterfaceAlias $ifaceName -IPAddress $ip -PrefixLength $mask -DefaultGateway $gateway -ErrorAction Stop

# Asignar servidor DNS
Set-DnsClientServerAddress -InterfaceAlias $ifaceName -ServerAddresses $dns -ErrorAction Stop

Write-Host "✅ Red configurada en la interfaz: $ifaceName"
Write-Host "   IP: $ip/$mask"
Write-Host "   Gateway: $gateway"
Write-Host "   DNS: $dns"