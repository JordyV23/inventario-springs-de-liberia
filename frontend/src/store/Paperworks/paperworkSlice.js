import { createSlice } from "@reduxjs/toolkit";

const initialState = {
  idPaperwork:"",
  idAsset: "",
  idPerson: "",
  fechaRegistro: "",
  fechaInicio: "",
  fechaFin: "",
  jsonDetalles: "",
  paperworks: [],
};

export const PaperworkSlice = createSlice({
  name: "paperworks",
  initialState,
  reducers: {
    clearPaperworkForm: (state, action) => {
      state.idPaperwork = "";
      state.idAsset = "";
      state.idPerson = "";
      state.fechaRegistro = "";
      state.fechaInicio = "";
      state.fechaFin = "";
      state.jsonDetalles = "";
    },
    setPaperworks: (state, action) => {
      state.paperworks = action.payload;
    },
    writeIdAsset: (state, action) => {
      state.idAsset = action.payload;
    },
    writeIdPerson: (state, action) => {
      state.idPerson = action.payload;
    },
    writeFechaRergistro: (state, action) => {
      state.fechaRegistro = action.payload;
    },
    writeFechaInicioPaperwork: (state, action) => {
      state.fechaInicio = action.payload;
    },
    writeFechaFinPaperwork: (state, action) => {
      state.fechaFin = action.payload;
    },
    writeJsonDetalles: (state, action) => {
      state.jsonDetalles = action.payload;
    },
  },
});

export const {
  clearPaperworkForm,
  writeFechaFinPaperwork,
  writeFechaInicioPaperwork,
  writeFechaRergistro,
  writeIdAsset,
  writeIdPerson,
  writeJsonDetalles,
  setPaperworks,
} = PaperworkSlice.actions;
