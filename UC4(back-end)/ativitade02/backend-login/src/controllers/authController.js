import bcrypt from 'bcryptjs'
import db from '../config/database.js'
import {generateToken} from '../utils/generateToken.js'



// CADASTRAR 

export const cadastrar = async (req, res) => {
    const { nome, email, senha } = req.body;

    if (!nome || !email || !senha) return res.status(400).json({ msg: "Preencha todos os campos" })

    // 1- Verifica se email ja existe
    const [existe] = await db.query('SELECT id FROM usuario WHERE email = ?', [email])

    if (existe.length > 0) return console.log("email cadastrado")

    //  2 - Criptografar  a senha

    const senhaHash = await bcrypt.hash(senha, 10)
    // console.log(senhaHash)


    // 3- salva no banco 
    db.query('INSERT INTO usuario(nome,email,senha) VALUE(?,?,?)', [nome, email, senhaHash]);
    res.status(201).json({ msg: `Usuario: ${nome} cadastrado com sucesso!` })

    // console.log(req.body)
}

// LOGIn

export const login = async (req, res) => {

    const { email, senha } = req.body;



    if (!email || !senha) return res.status(400).json({ msg: "Preecha todos os campos" });

    // 1- Buscar Usuario
    const [rows] = await db.query('SELECT * FROM usuario WHERE email = ? ', [email]);
    const usuario = rows[0]

    if (!usuario) return res.status(400).json({ msg: "Usuario não encontrado" })
        // console.log(usuario)

    // 2- Comprar a senha
    const senhaOk = await bcrypt.compare(senha,usuario.senha) 

    if(!senhaOk || !usuario) return res.status(400).json({msg : "E-mail ou Senha invalidos "})
    // console.log(senhaOk)

    // 3- Gerar Token

    const token = generateToken(usuario.id)

    res.status(201).json({
        msg: "Login Ok",
        token,
        usuario: {
            id : usuario.id,
            nome: usuario.nome,
            email: usuario.email
        }
    })
    // console.log(token)


}

// login(
//     {
//         body: {
//             email: "lussantosrocha@gmail.com",
//             senha: "321654"
//         }
//     },
//     {
//         status: codigo => ({ json: dados => console.log(codigo, dados) })
//     }
// );



// cadastrar(
//     {
//         body: {
//             nome: "Lucas",
//             email: "lussantosrocha@gmail.com",
//             senha: "321654"
//         }
//     },
//     {
//         status: codigo => ({ json: dados => console.log(codigo, dados) })
//     }
// );

