import jwt from 'jsonwebtoken';
import dotenv from 'dotenv';
import { generateToken } from '../utils/generateToken.js'
import { json } from 'express';


export const login = (req, res, next) => {

    const authorization = req.headers.authorization

    if (!authorization || !authorization.startsWith('Bearer')) return res.status(401).json({ msg: "Sem Token" })
        const token = authorization.slice(7)


        try {
            const decoded = jwt.verify(token, process.env.JWT_SECRET )

            req.usuarioId = decoded.id

            next()
            // console.log( decoded)
            
        } catch (error) {
            return res.status(401).json({ msg: "Token Invalido" })
        }
};


// // Requisisao simulada com o tokem gerado do arquivo 
// const requisicaoTeste = {
//     headers: {
//         authorization: generateToken(5)
//     }
// }

// // Resposta simula para exibir o resultado no console

// const respostaTeste = {
//     status: codigo => ({
//         json: dados => console.log('Resposta : ', codigo, dados)
//     })
// }

// const proximoPasso = ()=> console.log('Token valido. Id do usuario: ',requisicaoTeste.usuarioId)







// export default login(requisosicaoTeste,respostaTeste,proximoPas);

