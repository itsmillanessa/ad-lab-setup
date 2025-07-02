<#
.SYNOPSIS
    Instala y configura un nuevo Active Directory Domain Services en un nuevo bosque.

.DESCRIPTION
    Este script instala el rol AD DS y promueve el servidor a Domain Controller con DNS incluido.

.PARAMETER DomainName
    Nombre FQDN del dominio (por ejemplo: lab.local)

.PARAMETER NetbiosName
    Nombre NetBIOS del dominio (por ejemplo: LAB)

.PARAMETER SafeModePassword
    Contraseña del modo seguro para recuperación del directorio

.NOTAS
    Autor: @itsmillan
    Fecha: 2025-07-01
#>

param (
    [string]$DomainName = "lab.local",
    [string]$NetbiosName = "LAB",
    [string]$SafeModePassword = "P@ssword123"
)

# Convertir contraseña a SecureString
$securePassword = ConvertTo-SecureString $SafeModePassword -AsPlainText -Force

# Instalar rol AD DS
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools -ErrorAction Stop

# Promover como Domain Controller
Install-ADDSForest `
    -DomainName $DomainName `
    -DomainNetbiosName $NetbiosName `
    -SafeModeAdministratorPassword $securePassword `
    -InstallDns:$true `
    -Force

Write-Host "✅ AD DS instalado y configurado. El servidor se reiniciará automáticamente."