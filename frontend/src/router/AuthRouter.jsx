import React from "react";
import { Route, Routes } from "react-router-dom";
import { SpringLayout } from "../layouts/SpringLayout";
import {
  InventoryPage,
  MaintenancePage,
  Paperwork,
  PromotionsPage,
  RentalsPage,
  SellingsPage,
  UsersPage,
} from "../pages";

export const AuthRouter = () => {
  return (
    <SpringLayout>
      <Routes>
        <Route path="/users" element={<UsersPage />}></Route>
        <Route path="/promociones" element={<PromotionsPage />}></Route>
        <Route path="/inventario" element={<InventoryPage />}></Route>
        <Route path="/tramites" element={<Paperwork />}></Route>
        <Route path="/tramites/alquileres" element={<RentalsPage />}></Route>
        <Route path="/tramites/ventas" element={<SellingsPage />}></Route>
        <Route path="/mantenimientos" element={<MaintenancePage />}></Route>
      </Routes>
    </SpringLayout>
  );
};
