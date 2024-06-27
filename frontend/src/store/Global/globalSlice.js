import { createSlice } from "@reduxjs/toolkit";

const initialState = {
  isLoading: false,
  isLogged: false,
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
      console.log(action.payload)
      state.authUser = action.payload.username;
      state.authRol = action.payload.rol;
      state.token = action.payload.token;
      state.isLogged = true;
    },
    setLoading: (state, action) => {
      state.isLoading = action.payload;
    },
  },
});

export const { clear, setUserAsLogged, setLoading } = GlobalSlice.actions;
