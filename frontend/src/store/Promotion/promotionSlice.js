import { createSlice } from "@reduxjs/toolkit";

const initialState = {
  idPromo: "",
  titulo: "",
  fechaInicio: "",
  fechaFin: "",
  activa: true,
  descripcion: "",
  intervaloDias: "",
  isPeriodica: false,
  promotions: [],
};

export const PromotionSlice = createSlice({
  name: "promotions",
  initialState,
  reducers: {
    setPromotions: (state, action) => {
      state.promotions = action.payload;
    },
    writeTitulo: (state, action) => {
      state.titulo = action.payload;
    },
    writeDescripcion: (state, action) => {
      state.descripcion = action.payload;
    },
    writeFechaInicio: (state, action) => {
      state.fechaInicio = action.payload;
    },
    writeFechaFin: (state, action) => {
      state.fechaFin = action.payload;
    },
    writeActiva: (state, action) => {
      state.activa = action.payload;
    },
    writePeriodica: (state, action) => {
      state.isPeriodica = action.payload;
    },
    writeIntervaloDias: (state, action) => {
      state.intervaloDias = action.payload;
    },
    loadPromotionForm: (state, action) => {
      state.idPromo = action.payload.idAdvertisement;
      state.titulo = action.payload.titulo;
      state.descripcion = action.payload.descripcion;
      state.fechaInicio = action.payload.fechaInicio;
      state.fechaFin = action.payload.fechaFin;
      state.activa = action.payload.envioActivo;
      state.isPeriodica = action.payload.envioPeriodico;
      state.intervaloDias = action.payload.intervaloDiasNotificacion;
    },
    clearPromotionForm: (state, action) => {
      state.idPromo = "";
      state.titulo = "";
      state.descripcion = "";
      state.fechaInicio = "";
      state.fechaFin = "";
      state.activa = "";
      state.isPeriodica = "";
      state.intervaloDias = "";
    },
  },
});

export const {
  setPromotions,
  writeTitulo,
  writeFechaInicio,
  writeFechaFin,
  writeActiva,
  writeDescripcion,
  writeIntervaloDias,
  writePeriodica,
  loadPromotionForm,
  clearPromotionForm,
} = PromotionSlice.actions;
