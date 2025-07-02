# AD Lab Setup

Este repositorio contiene scripts de automatización para desplegar un Active Directory funcional en un entorno de laboratorio (ESXi, VMware, etc).

## scripts/Set-StaticIP.ps1

Este script configura una IP estática, gateway y DNS para una VM de Windows Server destinada a ser un Domain Controller.

### Uso

1. Inicia sesión como administrador en la VM de Windows.
2. Abre PowerShell como Administrador.
3. Ejecuta el script:

```powershell
.\scripts\Set-StaticIP.ps1
```

> Asegúrate de clonar el repositorio o copiar los archivos dentro de la VM.

---

## Próximamente

- Script para instalar AD DS (`Install-ADDSForest`)
- Script para crear usuarios y OUs
- Backup automático del System State
- Configuración de NTP y DNS