import React from "react";
import { Navigate } from "react-router-dom";

export const RequireAuth = ({ isLogged, children }) => {
  if (!isLogged) {
    return <Navigate to="login" />;
  }

  return children;
};
