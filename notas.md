# Anotações Curso DevOps - Alura

Este repositório contém as anotações organizadas e explicadas do curso de DevOps realizado com créditos cedidos pela Alura. A estrutura está dividida por aulas e cobre desde a criação do ambiente Docker até o deploy na Google Cloud Platform (GCP) com CI/CD.

---

## Aula 1: Setup do Docker

### 🎯 Objetivo

Configurar o ambiente do projeto com Docker, permitindo a execução do sistema de forma isolada.

### 🛠️ Etapas

1. **Criação do `Dockerfile`**

   - Define a imagem base e instruções de build do projeto.
   - Exemplo típico de um `Dockerfile`:

     ```dockerfile
     FROM python:3.10-slim

     WORKDIR /app

     COPY requirements.txt .

     RUN pip install --no-cache-dir -r requirements.txt

     COPY . .

     CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
     ```

2. **Criação do `.dockerignore`**

   - Arquivo responsável por ignorar arquivos desnecessários na imagem.
   - Exemplo:
     ```
     __pycache__/
     .git/
     *.pyc
     .env
     ```

3. **Comando para rodar o container:**
   ```bash
   docker run -p 8000:8000 --name gestao-escolar-app gestao-escolar-api
   ```

* `-p 8000:8000`: Mapeia a porta local 8000 para a porta do container.
* `--name gestao-escolar-app`: Define o nome do container.
* `gestao-escolar-api`: Nome da imagem usada.

---

## Aula 2: Criando um `docker-compose`

### 🎯 Objetivo

Facilitar o gerenciamento de múltiplos containers com `docker-compose`.

### 🛠️ Etapas

1. **Criar o arquivo `docker-compose.yml`**

 * Exemplo:

   ```yaml
   version: '3.8'

   services:
     app:
       build: .
       ports:
         - "8000:8000"
       container_name: gestao-escolar-app
       volumes:
         - .:/app
   ```

2. **Executar com o comando:**

 ```bash
 docker-compose up -d
````

---

## Aula 3: Deploy com Google Cloud

### 🎯 Objetivo

Realizar o deploy da aplicação na Google Cloud utilizando os créditos fornecidos pela Alura.

### 🛠️ Etapas

1. **Instalação da CLI do Google Cloud**

   - Site: [https://cloud.google.com/sdk/docs/install](https://cloud.google.com/sdk/docs/install)

2. **Login com a CLI:**

   ```bash
   gcloud auth login
   ```

3. **Selecionar a região padrão para o deploy:**

   ```bash
   gcloud config set run/region southamerica-east1
   ```

4. **Deploy usando Cloud Run**

   - Comando (exemplo):

     ```bash
     gcloud run deploy gestao-escolar-app \
       --source . \
       --platform managed \
       --allow-unauthenticated
     ```

---

## Aula Extra: Introdução ao CI/CD

### 💡 Conceito

CI/CD (Integração Contínua e Entrega Contínua) é o processo de automatização de:

- Testes de código,
- Build de imagem/container,
- Deploy automático para produção.

Ferramentas comuns:

- GitHub Actions
- GitLab CI
- CircleCI
- Jenkins

---

> ✅ **Dica:** Utilize variáveis de ambiente com `.env` (mas lembre-se de ignorá-lo no `.dockerignore` e `.gitignore`).
>
> 📌 Essa prática melhora a escalabilidade, organização e segurança da sua aplicação durante o desenvolvimento e produção.
