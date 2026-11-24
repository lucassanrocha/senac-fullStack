import jwt from 'jsonwebtoken'
import dotenv from 'dotenv'

dotenv.config()

export function generateToken(id) {
    return jwt.sign(
        { id },
        process.env.JWT_SECRET,
        { expiresIn: process.env.JWT_EXPIRES_IN }
    )
}



// console.log("Token gerado: ",generateToken(1))