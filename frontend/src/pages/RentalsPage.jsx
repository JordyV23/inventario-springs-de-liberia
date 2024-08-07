import React, { useEffect } from "react";
import { useSelector } from "react-redux";
import { useActionsPaperwork } from "../hooks";
import { FormModal, SpringDataTable, SpringForm } from "../components";
import { faTicket, faUserPlus } from "@fortawesome/free-solid-svg-icons";
import {
  rentalEditFields,
  rentalRegisterFields,
} from "../data/forms/paperworkFormFields";
import { clearPaperworkForm, loadPaperworkForm } from "../store";

export const RentalsPage = () => {
  const { rentals } = useSelector((state) => state.paperworks);
  const { users } = useSelector((state) => state.users);
  const { assets } = useSelector((state) => state.inventory);
  const { modalMode } = useSelector((state) => state.global);

  const assetsOptions = assets
    .filter((asset) => asset.Estado === "Disponible")
    .map((asset) => {
      return { value: asset.idAsset, label: asset.nombre };
    });
  const usersOptions = users.map((user) => {
    return { value: user.idPerson, label: user.nombreCompleto };
  });

  const { makeGetRentals, makeDeleteRental, makeCreateRental, makeEditRental } =
    useActionsPaperwork();

  rentalRegisterFields[0].fieldOptions = assetsOptions;
  rentalRegisterFields[1].fieldOptions = usersOptions;
  rentalEditFields[0].fieldOptions = assetsOptions;
  rentalEditFields[1].fieldOptions = usersOptions;

  useEffect(() => {
    makeGetRentals();
  }, []);

  const handleDelete = (row) => {
    makeDeleteRental(row);
  };

  const columnTitles = [
    "Codigo",
    "Nombre activo",
    "Fecha de Inicio",
    "Fecha de Fin",
  ];

  const formFields = {
    C: rentalRegisterFields,
    E: rentalEditFields,
  };

  return (
    <>
      <FormModal
        label={"Agregar Alquiler"}
        icon={faTicket}
        clearFunction={clearPaperworkForm}
        creationFunction={makeCreateRental}
        editionFunction={makeEditRental}
      >
        <SpringForm
          fields={formFields[modalMode]}
          submitEvent={makeCreateRental}
        />
      </FormModal>
      <SpringDataTable
        data={rentals}
        columnTitles={columnTitles}
        deleteFunction={handleDelete}
        editFunction={loadPaperworkForm}
        editModalTitle={"Editar"}
      />
    </>
  );
};
