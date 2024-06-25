import { useState } from "react";
import { Button } from "flowbite-react";
import { BrowserRouter } from "react-router-dom";
import { AppRouter } from "./router/AppRouter";
import { Provider } from "react-redux";
import { persist, store } from "./store/Store";
import { PersistGate } from "redux-persist/integration/react";

function InventarioApp() {
  return (
    <>
      <Provider store={store}>
        <PersistGate loading={null} persistor={persist}>
          <BrowserRouter>
            <AppRouter />
          </BrowserRouter>
        </PersistGate>
      </Provider>
    </>
  );
}

export default InventarioApp;
