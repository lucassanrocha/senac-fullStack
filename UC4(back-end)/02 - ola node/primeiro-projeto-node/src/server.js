const http = require('http')

const servidor = http.createServer((req, res) => {
    res.writeHead(200,{
        'Content-Type' : 'text/plain; charset=utf-8'
    });
    res.end('Ola, Mundo')
});

servidor.listen(3000, () =>{
    console.log(`Servidor Rodando em em http://localhost:3000`)
})