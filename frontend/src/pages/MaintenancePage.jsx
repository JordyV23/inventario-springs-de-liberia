import React, { useEffect } from "react";
import { useActionsInventory, useActionsMaintenance } from "../hooks";
import { useSelector } from "react-redux";
import { FormModal, SpringDataTable, SpringForm } from "../components";
import { faToolbox } from "@fortawesome/free-solid-svg-icons";
import {
  maintenanceEditionsFields,
  maintenanceRegisterFields,
} from "../data/forms/maintenanceFormFields";
import { clearRegisterMaintenanceForm, loadMaintenanceForm } from "../store";

export const MaintenancePage = () => {
  const { makeGetMaintenances, makeCreateMaintenance, makeDeleteMaintenance } =
    useActionsMaintenance();

  const { makeGetAsset } = useActionsInventory();

  const { assets } = useSelector((state) => state.inventory);
  const { mantenimientos } = useSelector((state) => state.maintenances);
  const { modalMode } = useSelector((state) => state.global);

  useEffect(() => {
    makeGetAsset();
    makeGetMaintenances();
  }, []);

  const assetsOptions = assets.map((asset) => {
    return { value: asset.idAsset, label: asset.nombre };
  });

  maintenanceRegisterFields[0].fieldOptions = assetsOptions;
  maintenanceEditionsFields[0].fieldOptions = assetsOptions;

  const columnTitles = ["Codigo", "Activo", "Averia", "Fecha de reporte"];

  const handleDelete = (row) => {
    makeDeleteMaintenance(row.idMaintenance);
  };

  const handleFormInputs = () => {
    if (modalMode === "C") {
      return maintenanceRegisterFields;
    }

    return maintenanceEditionsFields;
  };

  const handelEdit = () => {
    console.log("Hola")
  };

  return (
    <>
      <FormModal
        label={"Reportar Mantenimiento"}
        icon={faToolbox}
        clearFunction={clearRegisterMaintenanceForm}
        creationFunction={makeCreateMaintenance}
        editionFunction={handelEdit}
      >
        <SpringForm fields={handleFormInputs()} />
      </FormModal>
      <SpringDataTable
        data={mantenimientos}
        columnTitles={columnTitles}
        editModalTitle={"Cerra Mantenimiento"}
        editFunction={loadMaintenanceForm}
        deleteFunction={handleDelete}
        maintenancePage={true}
        renderEdit={false}
      />
    </>
  );
};
