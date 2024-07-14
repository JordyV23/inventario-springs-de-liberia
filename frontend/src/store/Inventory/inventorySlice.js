import { createSlice } from "@reduxjs/toolkit";

const initialState = {
  idActivo: "",
  titulo: "",
  tipoActivo: "",
  descripcion: "",
  disponibilidad: "",
  electrodomesticos: "",
  idCanton: "",
  distrito: "",
  idProvincia: "",
  direccion: "",
  numeroHabitaciones: "",
  precioGlobal: "0",
  precioPorMes: "",
  precioPorNoche: "",
  imagen: "",
  assets: [],
};

export const InventoriesSlice = createSlice({
  name: "inventory",
  initialState,
  reducers: {
    clearInventoryForm: (state, action) => {
      state.idActivo = "";
      state.titulo = "";
      state.tipoActivo = "";
      state.descripcion = "";
      state.disponibilidad = "";
      state.electrodomesticos = "";
      state.idCanton = "";
      state.distrito = "";
      state.idProvincia = "";
      state.numeroHabitaciones = "";
      state.precioGlobal = "";
      state.precioPorMes = "";
      state.precioPorNoche = "";
      state.imagen = "";
      state.direccion = "";
    },
    setAssets: (state, action) => {
      state.assets = action.payload;
    },
    writeTituloActivo: (state, action) => {
      state.titulo = action.payload;
    },
    writeTipoActivo: (state, action) => {
      state.tipoActivo = action.payload;
    },
    writeDescripcionActivo: (state, action) => {
      state.descripcion = action.payload;
    },
    writeDisponibilidad: (state, action) => {
      state.disponibilidad = action.payload;
    },
    writeElectrodomesticos: (state, action) => {
      state.electrodomesticos = action.payload;
    },
    writeIdCanton: (state, action) => {
      state.idCanton = action.payload;
    },
    writeIdDistrito: (state, action) => {
      state.distrito = action.payload;
    },
    writeIdProvincia: (state, action) => {
      state.idProvincia = action.payload;
    },
    writeDireccion: (state, action) => {
      state.direccion = action.payload;
    },
    writeNumeroHabitaciones: (state, action) => {
      state.numeroHabitaciones = action.payload;
    },
    writePrecioGlobal: (state, action) => {
      state.precioGlobal = action.payload;
    },
    writePrecioPorMes: (state, action) => {
      state.precioPorMes = action.payload;
    },
    writePrecioPorNoche: (state, action) => {
      state.precioPorNoche = action.payload;
    },
    writeImage: (state, action) => {
      state.imagen = action.payload;
    },
  },
});

export const {
  clearInventoryForm,
  setAssets,
  writeTituloActivo,
  writeTipoActivo,
  writeDescripcionActivo,
  writeDisponibilidad,
  writeElectrodomesticos,
  writeIdCanton,
  writeIdDistrito,
  writeIdProvincia,
  writeNumeroHabitaciones,
  writePrecioGlobal,
  writePrecioPorMes,
  writePrecioPorNoche,
  writeImage,
  writeDireccion,
} = InventoriesSlice.actions;
