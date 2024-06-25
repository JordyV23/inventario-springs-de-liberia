import { useState } from "react";
import { Button } from "flowbite-react";
import { BrowserRouter } from "react-router-dom";
import { AppRouter } from "./router/AppRouter";

function InventarioApp() {
  return (
    <>
      <BrowserRouter>
        <AppRouter />
      </BrowserRouter>
    </>
  );
}

export default InventarioApp;
