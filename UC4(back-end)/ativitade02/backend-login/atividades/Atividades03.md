# Etapa 3 - Configurar Arquivos
 
## 3.1 Criar arquivo .env
 
Na raiz do projeto:
 
```env
PORT=3000
 
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=
DB_NAME=sistema_login
 
JWT_SECRET=troque_por_uma_chave_grande_e_segura
JWT_EXPIRES_IN=1d
```
 
---
 
## 3.2 Criar .gitignore
 
```txt
node_modules
.env
```
 
---
 
## 3.3 Configurar package.json
 
Localize a seção scripts:
 
```json
"scripts": {
  "start": "node src/server.js",
  "dev": "nodemon src/server.js"
}
```
 
---