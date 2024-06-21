/**
 * @module DatabaseConnection
 * @description Módulo para gestionar la conexión a la base de datos SQL Server
 */

import sql from "mssql";

/**
 * Establece una conexión con la base de datos SQL Server
 * @async
 * @function getConnection
 * @returns {Promise<sql.ConnectionPool>} Un pool de conexiones a la base de datos
 * @throws {Error} Si ocurre un error durante la conexión
 */
export const getConnection = async () => {
  try {
    // Configuración de la conexión a la base de datos
    const dbSettings = {
      user: process.env.DBUSER, // Usuario de la base de datos
      password: process.env.DBPASS, // Contraseña de la base de datos
      server: process.env.DBSERVER, // Dirección del servidor de la base de datos
      database: process.env.DBNAME, // Nombre de la base de datos
      options: {
        encrypt: false, // Desactiva el cifrado de la conexión
        trustServerCertificate: true, // Confía en el certificado del servidor
      },
    };

    // Intenta establecer la conexión con la base de datos
    const pool = await sql.connect(dbSettings);

    // Devuelve el pool de conexiones si la conexión es exitosa
    return pool;
  } catch (error) {
    // Si ocurre un error, lo registra en la consola
    console.log(error);
  }
};
