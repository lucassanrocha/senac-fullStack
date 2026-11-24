import express from 'express'
import routes from './routes/authRoutes.js'
import cors from 'cors'
import {login} from './middlewares/authMiddleware.js'
const apps = express()



apps.use(cors())
apps.use(express.json())
apps.use(routes)

apps.get('/', (req,res) => res.json({msg : 'Backend '}))


apps.get('/api/perfil', login,(req,res) => res.json({msg : 'voce esta logado ', id : req.usuarioID}) )



export default apps