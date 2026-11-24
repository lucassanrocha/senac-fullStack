import fastify from 'fastify'

const server = fastify();

server.get('/', (req,res)=>{
    res.send("Hello Word!")
})

server.listen({
    port: 3333
}, console.log(`http://localhost:3333`)
)