# 🐳 Instalação do Docker no Ubuntu (WSL / Linux)

Este guia instala o Docker Engine oficial no Ubuntu, sem Docker Desktop.

---

## 📌 Pré-requisitos

- Ubuntu 20.04+ / 22.04+ / 24.04
- Usuário com sudo
- Acesso à internet

---

## 1. Atualizar sistema

```bash
sudo apt update && sudo apt upgrade -y
```

---

## 2. Instalar dependências

```bash
sudo apt install -y ca-certificates curl gnupg
```

---

## 3. Criar chave do repositório Docker

```bash
sudo install -m 0755 -d /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

sudo chmod a+r /etc/apt/keyrings/docker.gpg
```

---

## 4. Adicionar repositório Docker

```bash
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

---

## 5. Instalar Docker Engine

```bash
sudo apt update

sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

---

## 6. Permitir uso sem sudo (recomendado)

```bash
sudo usermod -aG docker $USER
```

Aplicar grupo:

```bash
newgrp docker
```

ou reinicie o terminal.

---

## 7. Testar instalação

```bash
docker run hello-world
```

---

## 8. Testar Docker Compose

```bash
docker compose version
```

---

## ✅ Resultado esperado

- Docker funcionando
- Compose disponível
- Containers rodando sem erro
