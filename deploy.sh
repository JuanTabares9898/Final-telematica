#!/bin/bash

echo " Iniciando despliegue de infraestructura con Terraform..."

#Verificar si Terraform está instalado,
if ! command -v terraform &> /dev/null; then
    echo " Terraform no está instalado. Por favor, instálalo antes de continuar."
    exit 1
fi

#Inicializar Terraform,
echo " Inicializando Terraform..."
terraform init

#Validar configuración,
echo " Validando archivos..."
terraform validate

#Planificar cambios,
echo " Planificando cambios..."
terraform plan -out=tfplan

#Aplicar cambios,
echo " Aplicando infraestructura..."
terraform apply tfplan

ip=$(terraform output -raw ip_publica)
echo "contenedor corriendo en el puerto 80"
echo "accede a la app en http://$ip"