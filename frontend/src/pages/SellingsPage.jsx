import React, { useEffect } from "react";
import { useSelector } from "react-redux";
import { useActionsPaperwork } from "../hooks";
import { FormModal, SpringDataTable, SpringForm } from "../components";
import { faSackDollar } from "@fortawesome/free-solid-svg-icons";
import { clearPaperworkForm } from "../store";
import { selllingRegisterFields } from "../data/forms/paperworkFormFields";

export const SellingsPage = () => {
  const { sellings } = useSelector((state) => state.paperworks);
  const { users } = useSelector((state) => state.users);
  const { assets } = useSelector((state) => state.inventory);

  const { makeGetSellings, makeDeleteSelling, makeCreateSelling } =
    useActionsPaperwork();

  useEffect(() => {
    makeGetSellings();
  }, []);

  const assetsOptions = assets
    .filter((asset) => asset.Estado === "Disponible")
    .map((asset) => {
      return { value: asset.idAsset, label: asset.nombre };
    });

  const usersOptions = users.map((user) => {
    return { value: user.idPerson, label: user.nombreCompleto };
  });

  selllingRegisterFields[0].fieldOptions = assetsOptions;
  selllingRegisterFields[1].fieldOptions = usersOptions;

  const columnTitles = ["Codigo", "Nombre activo", "Fecha de Venta"];

  const handleDelete = (row) => {
    makeDeleteSelling(row);
  };

  return (
    <>
      <FormModal
        label={"Agregar Venta"}
        icon={faSackDollar}
        clearFunction={clearPaperworkForm}
        creationFunction={makeCreateSelling}
        editionFunction={() => {}}
      >
        <SpringForm
          fields={selllingRegisterFields}
          submitEvent={makeCreateSelling}
        />
      </FormModal>
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
