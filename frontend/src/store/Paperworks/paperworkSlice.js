import { createSlice } from "@reduxjs/toolkit";

const initialState = {
  idPaperwork:"",
  idAsset: "",
  idPerson: "",
  fechaRegistro: "",
  fechaInicio: "",
  fechaFin: "",
  jsonDetalles: "",
  sellings: [],
  rentals: [],
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
    setSellings: (state, action) => {
      state.sellings = action.payload;
    },
    setRentals: (state, action) => {
      state.rentals = action.payload;
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
  setRentals,
  setSellings,
} = PaperworkSlice.actions;
