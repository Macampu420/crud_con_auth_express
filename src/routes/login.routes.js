import { Router } from 'express'
import Login from '../controllers/login/LoginCls.js'

const loginRouter = Router()
const objLogin = new Login()

loginRouter.post('/login', objLogin.login)

export default loginRouter
