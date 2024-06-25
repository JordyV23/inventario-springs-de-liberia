import { combineReducers } from "@reduxjs/toolkit";
import storage from "redux-persist/lib/storage";
import { UserSlice } from "./User/usersSlice";
import { persistReducer } from "redux-persist";

const persistConfig = {
  key: "root",
  version: 1,
  storage,
};

const rootReducer = combineReducers({
  users: UserSlice.reducer,
});

export const persistedReducer = persistReducer(persistConfig, rootReducer);
