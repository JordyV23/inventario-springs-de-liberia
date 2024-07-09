import React, { useEffect } from "react";
import { useActionsUsers } from "../hooks";
import { useSelector } from "react-redux";
import { FormModal, SpringDataTable, SpringForm } from "../components";
import { faUserPlus } from "@fortawesome/free-solid-svg-icons";
import { registerFields } from "../data";
import { clearForm } from "../store";

export const UsersPage = () => {
  const { makeGetUsers } = useActionsUsers();
  const { users } = useSelector((state) => state.users);

  const columnTitles = [
    "Cedula",
    "Nombre Completo",
    "Telefono",
    "Correo",
    "Usuario",
    "Rol",
  ];

  useEffect(() => {
    makeGetUsers();
  }, []);

  const handleSubtmiEvent = () => {
    console.log("Guardar");
  };

  return (
    <>
      <FormModal
        label={"Agregar Usuario"}
        icon={faUserPlus}
        clearFunction={clearForm}
        submitEvent={handleSubtmiEvent}
      >
        <SpringForm fields={registerFields} />
      </FormModal>
      <SpringDataTable
        data={users}
        columnTitles={columnTitles}
        editModalTitle={"Editar Usuarios"}
      />
    </>
  );
};
