/**
 * @module PersonaController
 * @description Controlador para manejar operaciones relacionadas con personas
 */

import bcrypt from "bcryptjs";
import jwt from "jsonwebtoken";
import {
  paEditPerson,
  paInhabilitarPerson,
  paIniciarSesion,
  paListarUsuarios,
  paRegisterPerson,
} from "../models/personas.model.js";
import { genealError } from "../helpers/index.js";

/**
 * Encripta una contraseña usando bcrypt
 * @param {string} password - Contraseña a encriptar
 * @returns {Promise<string>} Contraseña encriptada
 */
const encriptar = async (password) => {
  // Genera un salt para mejorar la seguridad de la contraseña
  const Salt = await bcrypt.genSalt();
  // Hashea la contraseña utilizando el salt generado
  return await bcrypt.hash(password, Salt);
};

/**
 * Registra una nueva persona
 * @param {Object} req - Objeto de solicitud Express
 * @param {Object} res - Objeto de respuesta Express
 */
export const registrarPersona = async (req, res) => {
  try {
    // Extrae los datos del cuerpo de la solicitud
    const {
      cedula,
      nombreCompleto,
      telefono,
      correo,
      username,
      password,
      rol,
    } = req.body;

    // Encripta la contraseña
    const PasswordHash = await encriptar(password);

    // Registra la persona en la base de datos
    let data = await paRegisterPerson(
      cedula,
      nombreCompleto,
      telefono,
      correo,
      username,
      PasswordHash,
      rol
    );

    // Envía una respuesta de éxito
    res.status(201).json({ success: true, data: "Registro exitoso" });
  } catch (error) {
    return genealError(res, error);
  }
};

/**
 * Inicia sesión de un usuario
 * @param {Object} req - Objeto de solicitud Express
 * @param {Object} res - Objeto de respuesta Express
 */
export const iniciarSesion = async (req, res) => {
  try {
    // Extrae el nombre de usuario y contraseña del cuerpo de la solicitud
    const { username, password } = req.body;

    // Busca el usuario en la base de datos
    let data = await paIniciarSesion(username);

    // Si no se encuentra el usuario, devuelve un mensaje de error
    if (!data) {
      return loginErrorMessage(res);
    }

    // Compara la contraseña proporcionada con la almacenada
    const isMatch = await bcrypt.compare(password, data.password);

    // Si las contraseñas no coinciden, devuelve un mensaje de error
    if (!isMatch) {
      return loginErrorMessage(res);
    }

    const responseData = {
      token: generateToken(data),
      username: data.username,
      rol: data.rol,
    };

    // Si la autenticación es exitosa, genera y envía un token
    res.status(200).json({ success: true, data: responseData });
  } catch (error) {
    return genealError(res, error);
  }
};

/**
 * Genera un mensaje de error para inicio de sesión fallido
 * @param {Object} res - Objeto de respuesta Express
 * @returns {Object} Respuesta JSON con estado 400 y mensaje de error
 */
const loginErrorMessage = (res) => {
  return res
    .status(401)
    .json({ success: false, data: "Usuario o Contraseña inválidos" });
};

/**
 * Genera un token JWT para el usuario autenticado
 * @param {Object} data - Datos del usuario
 * @returns {string} Token JWT
 */
const generateToken = (data) => {
  const options = {
    expiresIn: "1h",
  };

  return jwt.sign(
    {
      user: data.username,
      rol: data.rol,
    },
    process.env.JWT_SECRET,
    options
  );
};

/**
 * Edita los datos de una persona
 * @param {Object} req - Objeto de solicitud Express
 * @param {Object} res - Objeto de respuesta Express
 */
export const editarPersona = async (req, res) => {
  try {
    // Extrae los datos del cuerpo de la solicitud
    const {
      id,
      cedula,
      nombreCompleto,
      telefono,
      correo,
      username,
      password,
      rol,
    } = req.body;

    // Verifica si la contraseña ha cambiado y la encripta si es necesario
    let userPassword = await checkPasswordChange(username, password);

    // Actualiza los datos de la persona en la base de datos
    let data = await paEditPerson(
      id,
      cedula,
      nombreCompleto,
      telefono,
      correo,
      userPassword,
      rol
    );

    // Envía una respuesta de éxito
    res.status(201).json({ success: true, data: "Edición exitosa" });
  } catch (error) {
    return genealError(res, error);
  }
};

/**
 * Verifica si la contraseña ha cambiado y la encripta si es necesario
 * @param {string} username - Nombre de usuario
 * @param {string} password - Nueva contraseña
 * @returns {Promise<string>} Contraseña encriptada o actual
 */
const checkPasswordChange = async (username, password) => {
  let actualPassword = await paIniciarSesion(username);
  const isMatch = await bcrypt.compare(password, password);
  if (!isMatch) {
    return await encriptar(password);
  }
  return actualPassword;
};

/**
 * Obtiene la lista de todas las personas
 * @param {Object} req - Objeto de solicitud Express
 * @param {Object} res - Objeto de respuesta Express
 */
export const obtenerPersonas = async (req, res) => {
  try {
    // Obtiene la lista de usuarios de la base de datos
    let data = await paListarUsuarios();

    // Envía la lista de usuarios como respuesta
    res.status(201).json({ success: true, data });
  } catch (error) {
    return genealError(res, error);
  }
};

/**
 * Elimina (inhabilita) una persona
 * @param {Object} req - Objeto de solicitud Express
 * @param {Object} res - Objeto de respuesta Express
 */
export const eliminarPerson = async (req, res) => {
  try {
    // Extrae el ID de la persona del cuerpo de la solicitud
    const { id } = req.body;

    // Inhabilita la persona en la base de datos
    let data = await paInhabilitarPerson(id);

    // Envía una respuesta de éxito
    res.status(201).json({ success: true, data: "Eliminación exitosa" });
  } catch (error) {
    return genealError(res, error);
  }
};
