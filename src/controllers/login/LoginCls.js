import jwt from 'jsonwebtoken'

export default class Login {
  login = (req, res) => {
    const { correo, contrasena } = req.body

    // logica de validacion de usuario y contraseña
    // 1. usuario existe
    // 2. contraseña es correcta

    console.log(process.env)

    if (!correo) return res.status(400).json({ mensaje: 'El correo no existe' })

    if (!contrasena) return res.status(400).json({ mensaje: 'La contraseña es incorrecta' })

    const token = jwt.sign({ correo }, process.env.TOKEN_SECRET, {
      expiresIn: 60 * 60 * 24
    })

    return res.header('auth-token', token).json({ token })
  }
}
