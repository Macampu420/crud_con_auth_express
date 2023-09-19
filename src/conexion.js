import mysql from 'mysql2'

const conexion = mysql.createPool({
  host: '127.0.0.1',
  user: 'root',
  database: 'ejemplo_auth_express',
  password: 'macampu444',
  port: 3306,
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
