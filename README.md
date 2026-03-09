# 🛡️ Linux USB Hardware Lock

Este sistema utiliza pendrives como llaves físicas para autorizar el acceso en Ubuntu y Kali Linux a través de PAM.

## 🔍 Paso 1: Obtener el ID de tu USB
Conecta tu pendrive y ejecuta en la terminal:
```bash
lsusb
Copia el ID (ej: 0930:6544) y ponlo en el archivo usb-lock.sh.

Instalación
Mover el script:

Bash
sudo cp usb-lock.sh /usr/local/bin/check_usb_key.sh
sudo chmod +x /usr/local/bin/check_usb_key.sh

SCRIPT
#!/bin/bash
# Sustituye estos IDs por los tuyos reales (lsusb)
IDS="1234:abcd|5678:efgh|9012:ijkl"

if lsusb | grep -E "$IDS" > /dev/null; then
    exit 0
else
    exit 1
fi


Configurar PAM:
Edita el archivo de autenticación:

Comandos en bash son:
sudo nano /etc/pam.d/common-auth
Añade esta línea al principio:


auth required pam_exec.so quiet /usr/local/bin/check_usb_key.sh
Uso
Con USB: El sistema permite el acceso tras poner la contraseña.

Sin USB: El sistema deniega el acceso automáticamente.
