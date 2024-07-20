import React, { useEffect } from "react";
import { useActionsInventory, useActionsMaintenance } from "../hooks";
import { useDispatch, useSelector } from "react-redux";
import { FormModal, SpringDataTable, SpringForm } from "../components";
import { faToolbox } from "@fortawesome/free-solid-svg-icons";
import {
  maintenanceCloseFields,
  maintenanceEditionsFields,
  maintenanceRegisterFields,
} from "../data/forms/maintenanceFormFields";
import {
  changeModalState,
  clearMaintenanceForm,
  clearRegisterMaintenanceForm,
  loadMaintenanceForm,
  loadMaintenanceToClose,
  setCloseMaintenanceMode,
  writeModalTitle,
} from "../store";

export const MaintenancePage = () => {
  const {
    makeGetMaintenances,
    makeCreateMaintenance,
    makeDeleteMaintenance,
    makeCloseMaintenance,
  } = useActionsMaintenance();
  const { makeGetAsset } = useActionsInventory();

  const dispatch = useDispatch();

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
  maintenanceCloseFields[0].fieldOptions = assetsOptions;

  const columnTitles = [
    "Codigo",
    "Activo",
    "Averia",
    "Fecha de reporte",
    "Estado",
  ];

  const handleDelete = (row) => {
    makeDeleteMaintenance(row.idMaintenance);
  };

  const formModalInputs = {
    C: maintenanceRegisterFields,
    E: maintenanceEditionsFields,
    M: maintenanceCloseFields,
  };

  const handelEdit = () => {
    dispatch(changeModalState());
  };

  const handleView = (row) => {
    dispatch(loadMaintenanceForm(row));
  };

  const openCloseMaintenance = (row) => {
    dispatch(setCloseMaintenanceMode());
    dispatch(writeModalTitle("Cerrar Mantenimiento"));
    dispatch(loadMaintenanceToClose(row));
    dispatch(changeModalState());
  };

  return (
    <>
      <FormModal
        label={"Reportar Mantenimiento"}
        icon={faToolbox}
        clearFunction={clearMaintenanceForm}
        creationFunction={makeCreateMaintenance}
        editionFunction={handelEdit}
        closeMaintenanceFunction={makeCloseMaintenance}
      >
        <SpringForm fields={formModalInputs[modalMode]} />
      </FormModal>
      <SpringDataTable
        data={mantenimientos}
        columnTitles={columnTitles}
        editModalTitle={"Cerra Mantenimiento"}
        editFunction={handleView}
        deleteFunction={handleDelete}
        maintenancePage={true}
        renderEdit={false}
        closeMaintenance={openCloseMaintenance}
      />
    </>
  );
};
