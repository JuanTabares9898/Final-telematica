#!/bin/bash

echo "Destruyendo la infraestructura con terraform"

#Destruir la infraestructura
terraform destroy -auto-approve

echo "infraestructura destruida con éxito"