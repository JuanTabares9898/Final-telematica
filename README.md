# 🚀 Despliegue Automático de Infraestructura en AWS con Terraform y Docker

Este proyecto permite desplegar infraestructura automáticamente en AWS usando Terraform. A continuación se detallan los requisitos y pasos necesarios para su correcta ejecución.

---

## ✅ Requisitos Previos

Antes de ejecutar el contenedor, asegúrate de tener lo siguiente instalado en tu máquina:

- **[Terraform](https://developer.hashicorp.com/terraform/install)**  
- **[AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)**

Además, debes configurar correctamente tus credenciales de AWS para que Terraform tenga los permisos necesarios para interactuar con tu cuenta.

```bash
aws configure
```

Esto solicitará:

AWS Access Key ID
AWS Secret Access Key
AWS Session token (en caso de que sea por ejemplo un laboratorio)
Default region name (por ejemplo: us-east-1)
Default output format (puedes dejarlo vacío o usar json)

---

## 🔐 Configuración de credenciales AWS

En el archivo main.tf, ubica la línea 8:

```bash
public_key = file("~/.ssh/id_rsa.pub")
```

Deberás modificar la ruta para que apunte a la llave pública de tu equipo. Por ejemplo:

```bash
public_key = file("/home/usuario/.ssh/mi_llave.pub")
```

📌 Es fundamental para poder acceder vía SSH a las instancias creadas.

## 🚦 Permisos de ejecución

Dale permisos a los scripts deploy.sh y destroy.sh con los siguientes comandos:

```bash
chmod +x deploy.sh
```

```bash
chmod +x destroy.sh
```

## ▶️ Ejecución

Para desplegar la infraestructura:

```bash
./deploy.sh
```

Para destruir la infraestructura:

```bash
./destroy.sh
```