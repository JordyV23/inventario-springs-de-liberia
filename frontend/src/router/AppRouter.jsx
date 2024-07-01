import React from "react";
import { Route, Routes } from "react-router-dom";
import { LoginPage, RegisterPage } from "../pages/";
import { RequireAuth } from "../components/shared/RequireAuth";
import { useSelector } from "react-redux";
import { AuthRouter } from "./AuthRouter";
import { SpringLayout } from "../layouts/SpringLayout";

export const AppRouter = () => {
  return (
    <>
      <SpringLayout>
        <Routes>
          <Route path="/login" element={<LoginPage />} />
          <Route path="/register" element={<RegisterPage />} />
          <Route path="/*" element={<Authenticated />} />
        </Routes>
      </SpringLayout>
    </>
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
