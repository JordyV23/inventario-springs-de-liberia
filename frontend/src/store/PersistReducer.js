import { combineReducers } from "@reduxjs/toolkit";
import storage from "redux-persist/lib/storage";
import { UserSlice, GlobalSlice, PromotionSlice, InventoriesSlice } from "./";
import { persistReducer } from "redux-persist";

const persistConfig = {
  key: "root",
  version: 1,
  storage,
};

const rootReducer = combineReducers({
  users: UserSlice.reducer,
  promotions: PromotionSlice.reducer,
  inventory: InventoriesSlice.reducer,
  global: GlobalSlice.reducer,
});

export const persistedReducer = persistReducer(persistConfig, rootReducer);
