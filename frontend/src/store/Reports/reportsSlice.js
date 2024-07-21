import { createSlice } from "@reduxjs/toolkit";

const initialState = {
  idAsset: "",
  mes: "",
  year: "",
  reportMode: "RD",
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
      state.reportMode = "RD";
    },
    setRAReport: (state, action) => {
      state.reportMode = "RA";
    },
    setSDReport: (state, action) => {
      state.reportMode = "SD";
    },
    setUMReport: (state, action) => {
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
