import React from "react";
import { useSelector } from "react-redux";
import { Navigate } from "react-router-dom";

export const RouteGuard = ({ children, permisons }) => {
  const { authRol } = useSelector((state) => state.global);

  if (permisons.includes(authRol)) {
    return <>{children}</>;
  } else {
    return <Navigate to={"inventario"} />;
  }
};
