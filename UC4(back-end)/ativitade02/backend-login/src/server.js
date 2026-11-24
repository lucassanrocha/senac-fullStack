import dotenv from 'dotenv';
import apps from './app.js'
import db from './config/database.js'


dotenv.config()

 const app = apps


const PORT = process.env.SERVER_PORT || 3000

db.query('SELECT 1').then(()=>{
console.log('👌 MySQL conectado')
app.listen(PORT, ()=> console.log(`Servidor rorando na por http://localhost:${PORT}`))

})
.catch(err =>{ console.error('❌ ERROR MySQL:')
    console.error(err)
    });

