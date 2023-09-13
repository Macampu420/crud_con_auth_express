/* eslint-disable camelcase */
import jwt from 'jsonwebtoken'

export default function validarToken (req, res, next) {
  try {
    const { auth_token } = req.headers

    if (!auth_token) return res.status(401).json({ mensaje: 'Primero inicia sesion' })

    const decoded = jwt.verify(auth_token, process.env.TOKEN_SECRET)

    if (!decoded) return res.status(401).json({ mensaje: 'Tu sesion ha caducado' })

    next()
  } catch (error) {
    console.log('Error validarToken:', error)
    res.status(500).json({ mensaje: 'Error interno, por favor intentalo mas tarde' })
  }
}
