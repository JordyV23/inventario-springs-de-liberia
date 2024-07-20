import { createSlice } from "@reduxjs/toolkit";

const initialState = {
  idMaintenance: "",
  idAsset: "",
  idPerson: "",
  fechaMantenimiento: "",
  detalle: "",
  idOperario: "",
  motivo: "",
  costo: "",
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
      state.idOperario = "";
      state.motivo = "";
      state.costo = "";
      state.fechaCierre = "";
    },
    clearRegisterMaintenanceForm: (state, action) => {
      state.idAsset = "";
      state.detalle = "";
    },
    loadMaintenanceForm: (state, action) => {
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
  writeCosto,
  writeDetalle,
  writeFechaCierreMantenimiento,
  writeFechaMantenimiento,
  writeIdAssetMaintenance,
  writeIdMaintenance,
  writeIdOperario,
  writeIdPersonMaintenace,
  writeMotivo,
} = MaintenanceSlice.actions;
