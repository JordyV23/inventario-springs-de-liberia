import { Button, Spinner } from "flowbite-react";
import React from "react";

export const SpringLoader = () => {
  return (
    <div className="fixed inset-0 flex items-center justify-center bg-white opacity-55 z-30">
      <div className="text-center z-50">
        <Spinner className="fill-SpringGreen h-16 w-16" aria-label="Cargando" />
        <p className="mt-2 text-black">Cargando...</p>
      </div>
    </div>
  );
};
