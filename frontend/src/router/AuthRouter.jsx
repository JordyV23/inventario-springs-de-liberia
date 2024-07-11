import React from "react";
import { Route, Routes } from "react-router-dom";
import { UsersPage } from "../pages/UsersPage";
import { SpringLayout } from "../layouts/SpringLayout";
import { PromotionsPage } from "../pages";

export const AuthRouter = () => {
  return (
    <SpringLayout>
      <Routes>
        <Route path="/users" element={<UsersPage />}></Route>
        <Route path="/promociones" element={<PromotionsPage />}></Route>
      </Routes>
    </SpringLayout>
  );
};
