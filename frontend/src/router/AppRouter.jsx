import React from "react";
import { Route, Routes } from "react-router-dom";
import { LoginPage, RegisterPage } from "../pages/";

export const AppRouter = () => {
  return (
    <Routes>
      <Route path="/login" element={<LoginPage />} />
      <Route path="/register" element={<RegisterPage />} />
    </Routes>
  );
};
