#!/bin/bash

set -e

echo "🐳 Atualizando sistema..."
sudo apt update && sudo apt upgrade -y

echo "📦 Instalando dependências..."
sudo apt install -y ca-certificates curl gnupg

echo "🔑 Criando keyrings..."
sudo install -m 0755 -d /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo "📡 Adicionando repositório Docker..."
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "🐳 Instalando Docker Engine..."
sudo apt update

sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "👤 Adicionando usuário ao grupo docker..."
sudo usermod -aG docker $USER

echo "🧪 Testando Docker..."
docker run hello-world || echo "⚠️ Pode precisar reiniciar o terminal para aplicar permissões"

echo "📦 Testando Docker Compose..."
docker compose version

echo "✅ Docker instalado com sucesso!"
echo "⚠️ Se necessário, reinicie o terminal ou execute: newgrp docker"
