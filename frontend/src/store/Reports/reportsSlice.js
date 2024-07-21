import { createSlice } from "@reduxjs/toolkit";

const initialState = {
  idAsset: "",
  mes: "",
  year: "",
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
    writeMes: (state, action) => {
      state.mes = action.payload;
    },
    writeYear: (state, action) => {
      state.year = action.payload;
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
  writeIdAssetReport,
  writeMes,
  writeYear,
} = ReportsSlice.actions;
