import { Resend } from "resend";
import nodemailer from "nodemailer";

/**
 * Maneja errores generales y envía una respuesta de error
 * @param {Object} res - Objeto de respuesta Express
 * @param {Error} error - Objeto de error
 * @returns {Object} Respuesta JSON con estado 500 y mensaje de error
 */
export const genealError = (res, error) => {
  return res.status(500).json({
    success: false,
    data: error.message,
  });
};

export const generarUsuario = (nombreCompleto) => {
  // Dividir el nombre completo en partes
  const partes = nombreCompleto.toLowerCase().split(" ");

  // Tomar la primera letra del nombre y el primer apellido completo
  let usuario = partes[0][0] + partes[1];

  // Añadir números aleatorios al final
  const numeros = Array(4)
    .fill()
    .map(() => Math.floor(Math.random() * 10))
    .join("");

  return usuario + numeros;
};

/**
 * Envía un correo electrónico utilizando el servicio Resend.
 *
 * @async
 * @function sendMailWithResend
 * @param {string} to - La dirección de correo electrónico del destinatario.
 * @param {string} subject - El asunto del correo electrónico.
 * @param {string} htmlBody - El cuerpo del correo electrónico en formato HTML.
 * @throws {Error} Si ocurre un error durante el envío del correo.
 * @returns {Promise<void>}
 */
export const sendMailWithResend = async (to, subject, htmlBody) => {
  try {
    // Se crea una nueva instancia de Resend utilizando la clave de API almacenada en las variables de entorno
    const resend = new Resend(process.env.MAILKEY);

    // Se envía el correo electrónico utilizando el método send de Resend
    await resend.emails.send({
      from: process.env.MAILSENDER, // Dirección de correo del remitente, obtenida de las variables de entorno
      to: to, // Dirección de correo del destinatario
      subject: subject, // Asunto del correo
      html: htmlBody, // Cuerpo del correo en formato HTML
    });
  } catch (error) {
    // Si ocurre un error durante el envío, se registra en la consola
    console.log(error);
  }
};

/**
 * Envía un correo electrónico utilizando Nodemailer con el servicio de Gmail.
 *
 * @async
 * @function sendMailWithNodemailer
 * @param {string} to - La dirección de correo electrónico del destinatario.
 * @param {string} subject - El asunto del correo electrónico.
 * @param {string} htmlBody - El cuerpo del correo electrónico en formato HTML.
 * @throws {Error} Si ocurre un error durante el envío del correo.
 * @returns {Promise<void>}
 */
export const sendMailWithNodemailer = async (to, subject, htmlBody) => {
  // Crea un transporter de Nodemailer configurado para usar Gmail
  const transporter = nodemailer.createTransport({
    service: "gmail",
    auth: {
      user: process.env.MAILSENDER, // Dirección de correo del remitente
      pass: process.env.MAILPASS, // Contraseña o clave de aplicación para el correo del remitente
    },
  });

  // Define las opciones del correo electrónico
  const mailOptions = {
    from: process.env.MAILSENDER, // Dirección de correo del remitente
    to, // Dirección de correo del destinatario
    subject, // Asunto del correo
    html: htmlBody, // Cuerpo del correo en formato HTML
  };

  // Envía el correo electrónico
  await transporter.sendMail(mailOptions);
};
