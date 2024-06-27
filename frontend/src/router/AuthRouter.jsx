import React from "react";
import { Route, Routes } from "react-router-dom";
import { UsersPage } from "../pages/UsersPage";

export const AuthRouter = () => {
  return (
    <Routes>
      <Route path="/users" element={<UsersPage />}></Route>
    </Routes>
  );
};
