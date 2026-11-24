# Etapa 5 - Criar Conexão com Banco
 
## Arquivo: src/config/database.js
 
```js
const mysql = require('mysql2');
require('dotenv').config();
 
const pool = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME
});
 
// Teste de conexão
pool.getConnection((err, connection) => {
  if (err) {
    console.error('❌ Erro ao conectar:', err.message);
    return;
  }
 
  console.log('✅ Conectado ao MySQL com sucesso!');
  connection.release();
});
 
module.exports = pool.promise();
```
 
---