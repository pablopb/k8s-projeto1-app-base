#!/bin/bash

echo "Criando as imagens..."
docker build -t pablopb/projeto-backend:1.0 backend/.
docker build -t pablopb/projeto-database:1.0 database/.

echo "Realizando o push das imagens..."
docker push pablopb/projeto-backend:1.0 
docker push pablopb/projeto-database:1.0

echo "Criando serviços no cluster kubernetes..."

kubctl apply -f ./services.yml

echo "Criando os deployments..."
kubctl apply -f ./deployments.yml