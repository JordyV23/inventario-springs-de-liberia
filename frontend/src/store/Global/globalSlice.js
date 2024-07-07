import { createSlice } from "@reduxjs/toolkit";

const initialState = {
  sidebarOpen: false,
  isLoading: false,
  isLogged: false,
  isModalOpen: false,
  authUser: "",
  authRol: "",
  token: "",
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
      state.authUser = action.payload.username;
      state.authRol = action.payload.rol;
      state.token = action.payload.token;
      state.isLogged = true;
    },
    setLoading: (state, action) => {
      state.isLoading = action.payload;
    },
    changeSidebar: (state, action) => {
      state.sidebarOpen = !state.sidebarOpen;
    },
    changeModalState: (state, action) => {
      state.isModalOpen = !state.isModalOpen;
    },
  },
});

export const {
  clear,
  setUserAsLogged,
  setLoading,
  changeSidebar,
  changeModalState,
} = GlobalSlice.actions;
