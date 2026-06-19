Perfeito — isso é uma boa prática mesmo: **nunca colocar URL real de empresa em repositório público**.

Aqui está o seu **README em português, limpo e pronto para GitHub público**:

---

# 📊 Observability Lab

Ambiente local de observabilidade utilizando **Grafana (Docker + WSL2)** conectado a uma **API remota do Zabbix**, com foco em aprendizado de monitoramento, integração via API e automação de infraestrutura.

---

## 🚀 Visão Geral

Este projeto simula um cenário real de observabilidade onde um Grafana local consome métricas de um servidor Zabbix remoto através de API.

O objetivo é estudo e prática de:

* Observabilidade (métricas, dashboards e monitoramento)
* Integração com APIs (Zabbix JSON-RPC)
* Ambientes com Docker
* Base para automação com Python

---

## 🧱 Arquitetura

```text id="arch_pt"
                ┌──────────────────────────────┐
                │   Zabbix Server (Remoto)    │
                │   https://zabbix.example.com│
                └─────────────┬────────────────┘
                              │  API (JSON-RPC)
                              ▼
        ┌────────────────────────────────────────┐
        │   Máquina Local (Windows + WSL2)      │
        │                                        │
        │   ┌──────────────────────────────┐     │
        │   │ Docker Container (Grafana)   │     │
        │   │  - Porta: 3000             │     │
        │   │  - Plugin Zabbix           │     │
        │   └─────────────┬────────────────┘     │
        │                 ▼                      │
        │        Dashboard no navegador        │
        └────────────────────────────────────────┘
```

---

## ⚙️ Tecnologias Utilizadas

* 🐳 Docker
* 📊 Grafana
* 🔗 Zabbix API (JSON-RPC)
* 🐧 WSL2 (Ubuntu)
* 🐍 Python (futuro para automação)

---

## 📦 Estrutura do Projeto

```text id="struct_pt"
observability_lab/
├── docker-compose.yml      # Configuração do Grafana
├── README.md               # Documentação do projeto
├── scripts/
│   └── zabbix_api.py      # Integração futura com API do Zabbix
├── dashboards/            # Dashboards exportados do Grafana
└── configs/               # Arquivos de configuração opcionais
```

---

## 🚀 Como Executar

### 1. Clonar o repositório

```bash id="git_pt"
git clone https://github.com/seu-usuario/observability_lab.git
cd observability_lab
```

---

### 2. Subir o ambiente

```bash id="run_pt"
docker compose up -d
```

---

### 3. Acessar o Grafana

Abra no navegador:

```text id="url_pt"
http://localhost:3000
```

Usuário padrão:

* **Usuário:** admin
* **Senha:** admin

---

## 🔌 Integração com Zabbix

Dentro do Grafana:

1. Acesse **Data Sources**
2. Adicione **Zabbix**
3. Configure a URL da API:

```text id="zbx_pt"
https://zabbix.example.com/api_jsonrpc.php
```

4. Autentique com:

* usuário e senha do Zabbix
  ou
* token de API (caso disponível)

---

## 🔒 Segurança

* O Grafana é exposto apenas localmente:

```yaml id="sec_pt"
ports:
  - "127.0.0.1:3000:3000"
```

* Não há exposição para a rede externa
* O acesso ao Zabbix é feito via API autenticada
* Ambiente destinado exclusivamente para aprendizado

---

## 📈 Melhorias Futuras

* [ ] Automação com Python para consumo da API do Zabbix
* [ ] Processamento de métricas
* [ ] Geração automática de relatórios
* [ ] Provisionamento de dashboards como código
* [ ] Integração com Prometheus (opcional)

---

## 🐍 Camada Python (Futuro)

O projeto será expandido para:

* Autenticação via API do Zabbix
* Coleta de hosts e métricas
* Transformação de dados
* Exportação em JSON/CSV
* Automação de relatórios

---

## 🎯 Objetivos de Aprendizado

Este projeto tem como foco:

* Entender arquitetura de observabilidade
* Trabalhar com APIs reais (Zabbix JSON-RPC)
* Utilizar Docker no dia a dia
* Criar dashboards no Grafana
* Evoluir para automação com Python

---

## ⚠️ Aviso

Este projeto tem finalidade **educacional** e utiliza apenas integrações autorizadas com sistemas de monitoramento. Nenhum serviço é exposto publicamente.

---

## 📌 Autor

Projeto de aprendizado em observabilidade, automação de infraestrutura e integração de sistemas.

---