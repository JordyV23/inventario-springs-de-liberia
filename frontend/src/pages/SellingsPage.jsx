import React, { useEffect } from "react";
import { useSelector } from "react-redux";
import { useActionsPaperwork } from "../hooks";
import { SpringDataTable } from "../components";

export const SellingsPage = () => {
  const { sellings } = useSelector((state) => state.paperworks);

  const { makeGetSellings, makeDeleteSelling } = useActionsPaperwork();

  useEffect(() => {
    makeGetSellings();
  }, []);

  const columnTitles = [
    "Codigo",
    "Nombre activo",
    "Fecha de Venta",
  ];

  const handleDelete = (row) => {
    makeDeleteSelling(row);
  };

  return (
    <>
      <SpringDataTable
        data={sellings}
        columnTitles={columnTitles}
        deleteFunction={handleDelete}
        editFunction={() => {}}
        editModalTitle={"Editar"}
      />
    </>
  );
};
