import { createSlice } from "@reduxjs/toolkit";

const initialState = {
  idUser: "",
  rol: "",
  username: "",
  password: "",
  cedula: "",
  nombre: "",
  telefono: "",
  correo: "",
  users: [],
};

export const UserSlice = createSlice({
  name: "users",
  initialState,
  reducers: {
    clearForm: (state, action) => {
      state.idUser;
      state.username = "";
      state.password = "";
      state.cedula = "";
      state.nombre = "";
      state.telefono = "";
      state.correo = "";
      state.rol = "";
    },
    loadUserForm: (state, action) => {
      const {
        cedula,
        nombreCompleto,
        telefono,
        correoElectronico,
        username,
        rol,
        password,
        idPerson,
      } = action.payload;
      state.cedula = cedula;
      state.password = password;
      state.nombre = nombreCompleto;
      state.telefono = telefono;
      state.correo = correoElectronico;
      state.username = username;
      state.rol = rol;
      state.idUser = idPerson;
    },
    setUsers: (state, action) => {
      state.users = action.payload;
    },
    writeRol: (state, action) => {
      state.rol = action.payload;
    },
    writeUsername: (state, action) => {
      state.username = action.payload;
    },
    writePassword: (state, action) => {
      state.password = action.payload;
    },
    writeCedula: (state, action) => {
      state.cedula = action.payload;
    },
    writeNombre: (state, action) => {
      state.nombre = action.payload;
    },
    writeTelefono: (state, action) => {
      state.telefono = action.payload;
    },
    writeCorreo: (state, action) => {
      state.correo = action.payload;
    },
  },
});

export const {
  clearForm,
  setUsers,
  writeRol,
  writeUsername,
  writePassword,
  writeCedula,
  writeNombre,
  writeTelefono,
  writeCorreo,
  loadUserForm,
} = UserSlice.actions;
