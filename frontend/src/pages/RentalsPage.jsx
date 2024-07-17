import React, { useEffect } from "react";
import { useSelector } from "react-redux";
import { useActionsPaperwork } from "../hooks";
import { FormModal, SpringDataTable } from "../components";
import { faTicket, faUserPlus } from "@fortawesome/free-solid-svg-icons";

export const RentalsPage = () => {
  const { rentals } = useSelector((state) => state.paperworks);

  const { makeGetRentals, makeDeleteRental } = useActionsPaperwork();

  useEffect(() => {
    makeGetRentals();
  }, []);

  const handleDelete = (row) => {
    makeDeleteRental(row);
  };

  const columnTitles = ["Codigo", "Nombre activo", "Fecha de Inicio", "Fecha de Fin"];

  return (
    <>
      <FormModal
        label={"Agregar Renta"}
        icon={faTicket}
        clearFunction={()=>{}}
        creationFunction={()=>{}}
        editionFunction={()=>{}}
      >
        {<span>Aqui va el formulario</span>}
      </FormModal>
      <SpringDataTable
        data={rentals}
        columnTitles={columnTitles}
        deleteFunction={handleDelete}
        editFunction={() => {}}
        editModalTitle={"Editar"}
      />
    </>
  );
};
