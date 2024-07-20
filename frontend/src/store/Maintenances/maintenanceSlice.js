import { createSlice } from "@reduxjs/toolkit";

const initialState = {
  idMaintenance: "",
  idAsset: "",
  idPerson: "",
  fechaMantenimiento: "",
  detalle: "",
  detalleCierre: "",
  idOperario: "",
  motivo: "",
  costo: "0",
  fechaCierre: "",
  mantenimientos: [],
};

export const MaintenanceSlice = createSlice({
  name: "maintenance",
  initialState,
  reducers: {
    clearMaintenanceForm: (state, action) => {
      state.idMaintenance = "";
      state.idAsset = "";
      state.idPerson = "";
      state.fechaMantenimiento = "";
      state.detalle = "";
      state.detalleCierre = ""
      state.idOperario = "";
      state.motivo = "";
      state.costo = "0";
      state.fechaCierre = "";
    },
    clearRegisterMaintenanceForm: (state, action) => {
      state.idAsset = "";
      state.detalle = "";
    },
    loadMaintenanceForm: (state, action) => {
      state.idAsset = action.payload.idAsset;
      state.detalle = action.payload.detalle;
    },
    loadMaintenanceToClose: (state, action) => {
      state.idMaintenance = action.payload.idMaintenance;
      state.idAsset = action.payload.idAsset;
      state.detalle = action.payload.detalle;
    },
    writeIdMaintenance: (state, action) => {
      state.idMaintenance = action.payload;
    },
    writeIdAssetMaintenance: (state, action) => {
      state.idAsset = action.payload;
    },
    writeIdPersonMaintenace: (state, action) => {
      state.idPerson = action.payload;
    },
    writeFechaMantenimiento: (state, action) => {
      state.fechaMantenimiento = action.payload;
    },
    writeDetalle: (state, action) => {
      state.detalle = action.payload;
    },
    writeDetalleCierre: (state, action) => {
      state.detalleCierre = action.payload;
    },
    writeIdOperario: (state, action) => {
      state.idOperario = action.payload;
    },
    writeMotivo: (state, action) => {
      state.motivo = action.payload;
    },
    writeCosto: (state, action) => {
      state.costo = action.payload;
    },
    writeFechaCierreMantenimiento: (state, action) => {
      state.fechaCierre = action.payload;
    },
    setMantenimientos: (state, action) => {
      state.mantenimientos = action.payload;
    },
  },
});

export const {
  clearMaintenanceForm,
  clearRegisterMaintenanceForm,
  setMantenimientos,
  loadMaintenanceForm,
  loadMaintenanceToClose,
  writeCosto,
  writeDetalle,
  writeDetalleCierre,
  writeFechaCierreMantenimiento,
  writeFechaMantenimiento,
  writeIdAssetMaintenance,
  writeIdMaintenance,
  writeIdOperario,
  writeIdPersonMaintenace,
  writeMotivo,
} = MaintenanceSlice.actions;
