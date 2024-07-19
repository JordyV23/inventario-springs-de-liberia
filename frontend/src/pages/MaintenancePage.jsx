import React, { useEffect } from "react";
import { useActionsInventory, useActionsMaintenance } from "../hooks";
import { useSelector } from "react-redux";
import { FormModal, SpringDataTable, SpringForm } from "../components";
import { faToolbox } from "@fortawesome/free-solid-svg-icons";
import { maintenanceRegisterFields } from "../data/forms/maintenanceFormFields";
import { clearRegisterMaintenanceForm } from "../store";

export const MaintenancePage = () => {
  const { makeGetMaintenances, makeCreateMaintenance, makeDeleteMaintenance } =
    useActionsMaintenance();

  const { makeGetAsset } = useActionsInventory();

  const { assets } = useSelector((state) => state.inventory);
  const { mantenimientos } = useSelector((state) => state.maintenances);

  useEffect(() => {
    makeGetAsset();
    makeGetMaintenances();
  }, []);

  const assetsOptions = assets.map((asset) => {
    return { value: asset.idAsset, label: asset.nombre };
  });

  maintenanceRegisterFields[0].fieldOptions = assetsOptions;

  const columnTitles = ["Codigo", "Activo", "Averia", "Fecha de reporte"];

  const handleDelete = (row) => {
    makeDeleteMaintenance(row.idMaintenance);
  };

  return (
    <>
      <FormModal
        label={"Reportar Mantenimiento"}
        icon={faToolbox}
        clearFunction={clearRegisterMaintenanceForm}
        creationFunction={makeCreateMaintenance}
        editionFunction={{}}
      >
        <SpringForm fields={maintenanceRegisterFields} />
      </FormModal>
      <SpringDataTable
        data={mantenimientos}
        columnTitles={columnTitles}
        editModalTitle={"Cerra Mantenimiento"}
        editFunction={{}}
        deleteFunction={handleDelete}
      />
    </>
  );
};
