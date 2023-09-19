import mysql from 'mysql2'

const conexion = mysql.createPool({
  host: 'http://146.190.220.48/',
  user: 'root',
  database: 'ejemplo_auth_express',
  password: '',
  connectionLimit: 10
})

conexion.getConnection((err, connection) => {
  if (err) {
    console.error('Error al conectar a la base de datos:', err)
    throw new Error('Error de conexión a la base de datos')
  }

  console.log('Conexión exitosa a la base de datos.')

  // Importante liberar la conexión después de comprobarla
  connection.release()
})

const pool = conexion.promise()

export default pool
