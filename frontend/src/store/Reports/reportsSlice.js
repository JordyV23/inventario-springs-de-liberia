import { createSlice } from "@reduxjs/toolkit";

const initialState = {
  idAsset: "",
  mes: "",
  year: "",
  reportMode: "RD",
  reportTitle: "",
  reportData: [],
};

export const ReportsSlice = createSlice({
  name: "reports",
  initialState,
  reducers: {
    setReportData: (state, action) => {
      state.reportData = action.payload;
    },
    writeIdAssetReport: (state, action) => {
      state.idAsset = action.payload;
    },
    writeFechaReporte: (state, action) => {
      let [anio, mes] = action.payload.split("-");
      state.mes = mes;
      state.year = anio;
    },
    setRDReport: (state, action) => {
      state.reportTitle = "Reporte de Alquileres por fecha"
      state.reportMode = "RD";
    },
    setRAReport: (state, action) => {
      state.reportTitle = "Reporte de Alquileres por Activo"
      state.reportMode = "RA";
    },
    setSDReport: (state, action) => {
      state.reportTitle = "Reporte de Ventas Por Fecha"
      state.reportMode = "SD";
    },
    setUMReport: (state, action) => {
      state.reportTitle = "Reporte de Mantenimientos No Finalizados"
      state.reportMode = "UM";
    },
    clearFormReport: (state, action) => {
      state.idAsset = "";
      state.mes = "";
      state.year = "";
    },
  },
});

export const {
  setReportData,
  clearFormReport,
  setRDReport,
  setRAReport,
  setSDReport,
  setUMReport,
  writeIdAssetReport,
  writeFechaReporte,
  writeYear,
} = ReportsSlice.actions;
