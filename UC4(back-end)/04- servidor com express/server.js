import express from 'express'

const app = express();
const PORT = 3000;
const host =  '127.0.0.1'


app.get('/', (req, res) => {
  res.send('Hello World!')
});

app.get('/cursos', (req, res) => {
  res.send('Devesvolvedor FullStack')
});


app.listen(PORT, () => console.log(`Servidor rodando em http://${host}:${PORT}`));
