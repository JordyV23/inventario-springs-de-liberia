import React from "react";
import { Route, Routes } from "react-router-dom";
import { SpringLayout } from "../layouts/SpringLayout";
import { InventoryPage, Paperwork, PromotionsPage, UsersPage } from "../pages";

export const AuthRouter = () => {
  return (
    <SpringLayout>
      <Routes>
        <Route path="/users" element={<UsersPage />}></Route>
        <Route path="/promociones" element={<PromotionsPage />}></Route>
        <Route path="/inventario" element={<InventoryPage />}></Route>
        <Route path="/tramites" element={<Paperwork />}></Route>
      </Routes>
    </SpringLayout>
  );
};
