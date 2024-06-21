import bcrypt from "bcryptjs";
import jwt from "jsonwebtoken";
import {
  paEditPerson,
  paInhabilitarPerson,
  paIniciarSesion,
  paListarUsuarios,
  paRegisterPerson,
} from "../models/personas.model.js";

const genealError = (res, error) => {
  return res.status(500).json({
    succes: false,
    data: error.message,
  });
};

const encriptar = async (password) => {
  // Genera un salt para mejorar la seguridad de la contraseña.
  const Salt = await bcrypt.genSalt();
  // Hashea la contraseña utilizando el salt generado.
  return await bcrypt.hash(password, Salt);
};

export const registrarPersona = async (req, res) => {
  try {
    const {
      cedula,
      nombreCompleto,
      telefono,
      correo,
      username,
      password,
      rol,
    } = req.body;

    const PasswordHash = await encriptar(password);

    let data = await paRegisterPerson(
      cedula,
      nombreCompleto,
      telefono,
      correo,
      username,
      PasswordHash,
      rol
    );

    res.status(201).json({ succes: true, data: "Registro exitoso" });
  } catch (error) {
    return genealError(res, error);
  }
};

export const iniciarSesion = async (req, res) => {
  try {
    const { username, password } = req.body;

    let data = await paIniciarSesion(username);

    if (!data) {
      return loginErrorMessage(res);
    }

    const isMatch = await bcrypt.compare(password, data.password);

    if (!isMatch) {
      return loginErrorMessage(res);
    }

    res.status(201).json({ succes: true, data: generateToken(data) });
  } catch (error) {
    return genealError(res, error);
  }
};

const loginErrorMessage = (res) => {
  return res
    .status(400)
    .json({ succes: false, data: "Usuario o Contraseña inválidos" });
};

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

export const editarPersona = async (req, res) => {
  try {
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

    let userPassword = await checkPasswordChange(username, password);

    let data = await paEditPerson(
      id,
      cedula,
      nombreCompleto,
      telefono,
      correo,
      userPassword,
      rol
    );

    res.status(201).json({ succes: true, data: "Edición exitosa" });
  } catch (error) {
    return genealError(res, error);
  }
};

const checkPasswordChange = async (username, password) => {
  let actualPassword = await paIniciarSesion(username);
  const isMatch = await bcrypt.compare(password, password);
  if (!isMatch) {
    return await encriptar(password);
  }
  return actualPassword;
};

export const obtenerPersonas = async (req, res) => {
  try {
    let data = await paListarUsuarios();

    res.status(201).json({ succes: true, data });
  } catch (error) {
    return genealError(res, error);
  }
};

export const eliminarPerson = async (req, res) => {
  try {
    const { id } = req.body;

    let data = await paInhabilitarPerson(id);

    res.status(201).json({ succes: true, data: "Eliminación exitosa" });
  } catch (error) {
    return genealError(res, error);
  }
};
