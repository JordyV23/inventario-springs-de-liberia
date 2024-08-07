import { createSlice } from "@reduxjs/toolkit";

const initialState = {
  sidebarOpen: false,
  isLoading: false,
  isLogged: false,
  isModalOpen: false,
  authUser: "",
  authUserId: "",
  authRol: "",
  token: "",
  modalTitle: "",
  modalMode: "",
};

export const GlobalSlice = createSlice({
  name: "global",
  initialState,
  reducers: {
    clear: (state, action) => {
      state.isLoading = false;
      state.isLogged = false;
      state.authUser = "";
      state.authRol = "";
      state.token = "";
    },
    setUserAsLogged: (state, action) => {
      state.authUserId = action.payload.idPerson;
      state.authUser = action.payload.username;
      state.authRol = action.payload.rol;
      state.token = action.payload.token;
      state.isLogged = true;
    },
    setLoading: (state, action) => {
      state.isLoading = action.payload;
    },
    setCloseMaintenanceMode: (state, action) => {
      state.modalMode = "M";
    },
    setEdition: (state, action) => {
      state.modalMode = "E";
    },
    setCreation: (state, action) => {
      state.modalMode = "C";
    },
    changeSidebar: (state, action) => {
      state.sidebarOpen = !state.sidebarOpen;
    },
    changeModalState: (state, action) => {
      state.isModalOpen = !state.isModalOpen;
    },
    writeModalTitle: (state, action) => {
      state.modalTitle = action.payload;
    },
  },
});

export const {
  clear,
  setUserAsLogged,
  setLoading,
  setCloseMaintenanceMode,
  setEdition,
  setCreation,
  changeSidebar,
  changeModalState,
  writeModalTitle,
} = GlobalSlice.actions;
