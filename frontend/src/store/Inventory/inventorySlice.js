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
  precioPorMes: "0",
  precioPorNoche: 0,
  imagen: "",
  querySucces: false,
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
      state.precioGlobal = "0";
      state.precioPorMes = "0";
      state.precioPorNoche = "0";
      state.imagen = "";
      state.direccion = "";
    },
    loadInventoryForm: (state, action) => {
      state.idActivo = action.payload.idAsset;
      state.titulo = action.payload.nombre;
      state.tipoActivo = action.payload.TipoActivo;
      state.descripcion = action.payload.descripcion;
      state.disponibilidad = action.payload.disponibilidad;
      state.electrodomesticos = action.payload.electrodomesticos;
      state.idCanton = action.payload.idCanton;
      state.distrito = action.payload.distrito;
      state.idProvincia = action.payload.idProvincia;
      state.numeroHabitaciones = action.payload.numeroHabitaciones;
      state.precioGlobal = action.payload.precioGlobal;
      state.precioPorMes = action.payload.precioPorMes;
      state.precioPorNoche = action.payload.precioPorNoche;
      // state.imagen = action.payload.imagen;
      state.direccion = action.payload.Direccion;
    },
    setAssets: (state, action) => {
      state.assets = action.payload;
    },
    changeQueryState: (state, action) => {
      state.querySucces = action.payload;
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
  loadInventoryForm,
  setAssets,
  changeQueryState,
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
