import React from "react";
import { Route, Routes } from "react-router-dom";
import { UsersPage } from "../pages/UsersPage";
import { SpringLayout } from "../layouts/SpringLayout";

export const AuthRouter = () => {
  return (
    <SpringLayout>
      <Routes>
        <Route path="/users" element={<UsersPage />}></Route>
      </Routes>
    </SpringLayout>
  );
};
