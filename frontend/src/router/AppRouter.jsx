import React from "react";
import { Route, Routes } from "react-router-dom";
import { LoginPage, RegisterPage } from "../pages/";
import { RequireAuth } from "../components/shared/RequireAuth";
import { useSelector } from "react-redux";
import { AuthRouter } from "./AuthRouter";

export const AppRouter = () => {
  return (
    <Routes>
      <Route path="/login" element={<LoginPage />} />
      <Route path="/register" element={<RegisterPage />} />
      <Route path="/*" element={<Authenticated />} />
    </Routes>
  );
};

const Authenticated = () => {
  const { isLogged } = useSelector((state) => state.global);
  return (
    <>
      <RequireAuth isLogged={isLogged}>
        <AuthRouter />
      </RequireAuth>
    </>
  );
};
