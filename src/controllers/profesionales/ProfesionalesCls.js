import pool from '../../conexion.js'
import bcrypt from 'bcryptjs'

export default class Profesionales {
  #encriptarContrasena = async (contrasena) => {
    const salt = await bcrypt.genSalt(10)
    const hashedPassword = await bcrypt.hash(contrasena, salt)
    return hashedPassword
  }

  // metodo que se conecta a la bd y se trae todos los regitros de la tabla profesionales
  traerProfesionales = async (req, res) => {
    try {
      const [profesionales] = await pool.query('SELECT * FROM tblprofesional')
      return res.status(200).json({ profesionales })
    } catch (error) {
      console.error('Error traerProfesionales:', error)
      res
        .status(500)
        .json({ mensaje: 'Error interno, por favor intentalo mas tarde' })
    }
  }

  traerProfesionalDocumento = async (req, res) => {
    const { documento } = req.params
    try {
      const [profesional] = await pool.query(
        'SELECT * FROM tblprofesional WHERE documento = ?',
        [documento]
      )
      return res.status(200).json({ profesional })
    } catch (error) {
      console.log('Error traerProfesionalDocumento:', error)
      res
        .status(500)
        .json({ mensaje: 'Error interno, por favor intentalo mas tarde' })
    }
    res.end()
  }

  crearProfesional = async (req, res) => {
    const {
      documento,
      nombre,
      apellido,
      telefono,
      correo,
      cargo,
      experiencia,
      contrasena
    } = req.body

    const contrasenaEncriptada = await this.#encriptarContrasena(contrasena)
    console.log('contrasenaEncriptada:', contrasenaEncriptada)
    try {
      await pool.query(
        'INSERT INTO tblprofesional (documento, nombre, apellido, telefono, correo, cargo, experiencia, PASSWORD) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
        [
          documento,
          nombre,
          apellido,
          telefono,
          correo,
          cargo,
          experiencia,
          contrasenaEncriptada
        ]
      )
      return res.status(200).json({ mensaje: 'Profesional creado correctamente' })
    } catch (error) {
      console.log('Error crearProfesional:', error)
      res
        .status(500)
        .json({ mensaje: 'Error interno, por favor intentalo mas tarde' })
    }
  }

  actualizarProfesional = async (req, res) => {}

  eliminarProfesional = async (req, res) => {
    const { documento } = req.params
    try {
      await pool.query('DELETE FROM tblprofesional WHERE documento = ?', [
        documento
      ])
      return res
        .status(200)
        .json({ mensaje: 'Profesional eliminado correctamente' })
    } catch (error) {
      console.log('Error eliminarProfesional:', error)
      res
        .status(500)
        .json({ mensaje: 'Error interno, por favor intentalo mas tarde' })
    }
  }
}
