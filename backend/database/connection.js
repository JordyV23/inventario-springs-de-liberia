import sql from "mssql";

export const getConnection = async () => {
  try {
    const dbSettings = {
      user: process.env.DBUSER,
      password: process.env.DBPASS,
      server: process.env.DBSERVER,
      database: process.env.DBNAME,
      options: {
        encrypt: false,
        trustServerCertificate: true,
      },
    };

    const pool = await sql.connect(dbSettings);
    return pool;
  } catch (error) {
    console.log(error);
  }
};
