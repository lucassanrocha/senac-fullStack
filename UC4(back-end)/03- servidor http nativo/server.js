import {createServer} from 'http';

const server = createServer((req,res) => {
    res.write('hello Word!');
    return res.end();
});

server.listen(3333, ()=> console.log(`Rodando em http://localhost:3333`));