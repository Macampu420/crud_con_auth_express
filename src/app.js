import express from 'express'
import routerProfesionales from './routes/profesionales.routes.js'
import routerLogin from './routes/login.routes.js'
import dotenv from 'dotenv'
import path from 'path'
import { fileURLToPath } from 'url'

const __filename = fileURLToPath(import.meta.url)
const __dirname = path.dirname(__filename)

// configuracion de las variables de entorno
dotenv.config({
  path: path.join(__dirname, './.env')
})

const app = express()
const port = process.env.PORT || 3000

app.use('/api/profesionales', routerProfesionales)
app.use('/api/login', routerLogin)

app.listen(port, () => console.log(`Server running on port ${port}`))
