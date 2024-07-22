import React from "react";
import { Navigate, Route, Routes } from "react-router-dom";
import { SpringLayout } from "../layouts/SpringLayout";
import {
  InventoryPage,
  MaintenancePage,
  Paperwork,
  PromotionsPage,
  RentalsPage,
  ReportsPage,
  SellingsPage,
  UsersPage,
} from "../pages";
import { RouteGuard } from "../components/RouteGuard";
import { springLinks } from "../data";

export const AuthRouter = () => {
  return (
    <SpringLayout>
      <Routes>
        <Route
          path="/users"
          element={
            <RouteGuard permisons={springLinks[0].allowed}>
              <UsersPage />
            </RouteGuard>
          }
        />

        <Route
          path="/promociones"
          element={
            <RouteGuard permisons={springLinks[1].allowed}>
              <PromotionsPage />
            </RouteGuard>
          }
        />

        <Route path="/inventario" element={<InventoryPage />} />

        <Route
          path="/tramites"
          element={
            <RouteGuard permisons={springLinks[3].allowed}>
              <Paperwork />
            </RouteGuard>
          }
        />

        <Route
          path="/tramites/alquileres"
          element={
            <RouteGuard permisons={springLinks[3].allowed}>
              <RentalsPage />
            </RouteGuard>
          }
        />

        <Route
          path="/tramites/ventas"
          element={
            <RouteGuard permisons={springLinks[3].allowed}>
              <SellingsPage />
            </RouteGuard>
          }
        />

        <Route
          path="/mantenimientos"
          element={
            <RouteGuard permisons={springLinks[4].allowed}>
              <MaintenancePage />
            </RouteGuard>
          }
        />

        <Route
          path="/reportes"
          element={
            <RouteGuard permisons={springLinks[5].allowed}>
              <ReportsPage />
            </RouteGuard>
          }
        />

        <Route path="*" element={<Navigate to="/inventario" replace />} />
      </Routes>
    </SpringLayout>
  );
};
