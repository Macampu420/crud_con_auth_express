import { Router } from 'express'
import Profesionales from '../controllers/profesionales/ProfesionalesCls.js'
import validarToken from '../middlewares/validarToken.js'

const routerProfesionales = Router()
const objProfesionales = new Profesionales()

routerProfesionales.get('/traerProfesionales', validarToken, objProfesionales.traerProfesionales)

routerProfesionales.get('/traerProfesionalDocumento/:documento', validarToken, objProfesionales.traerProfesionalDocumento)

routerProfesionales.delete('/eliminarProfesional/:documento', validarToken, objProfesionales.eliminarProfesional)

routerProfesionales.post('/crearProfesional', validarToken, objProfesionales.crearProfesional)

export default routerProfesionales
