# 🛡️ Linux USB Hardware Lock

Este sistema utiliza pendrives como llaves físicas para autorizar el acceso en Ubuntu y Kali Linux a través de PAM.

## 🔍 Paso 1: Obtener el ID de tu USB
Conecta tu pendrive y ejecuta en la terminal:
```bash
lsusb
Copia el ID (ej: 0930:6544) y ponlo en el archivo usb-lock.sh.

🛠️ Instalación
Mover el script:

Bash
sudo cp usb-lock.sh /usr/local/bin/check_usb_key.sh
sudo chmod +x /usr/local/bin/check_usb_key.sh
Configurar PAM:
Edita el archivo de autenticación:

Bash
sudo nano /etc/pam.d/common-auth
Añade esta línea al principio:

Plaintext
auth required pam_exec.so quiet /usr/local/bin/check_usb_key.sh
🚀 Uso
Con USB: El sistema permite el acceso tras poner la contraseña.

Sin USB: El sistema deniega el acceso automáticamente.
