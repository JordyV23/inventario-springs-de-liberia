import { createSlice } from "@reduxjs/toolkit";

const initialState = {
  token: "",
  rol: "",
  username: "",
};

export const UserSlice = createSlice({
  name: "users",
  initialState,
  reducers: {
    setUsers: (state, action) => {
      state.users = action.payload;
    },
  },
});

export const { setUsers } = UserSlice.actions;
