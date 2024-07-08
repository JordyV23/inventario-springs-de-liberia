import React, { useEffect } from "react";
import { useActionsUsers } from "../hooks";
import { useSelector } from "react-redux";
import { FormModal, SpringDataTable } from "../components";
import { faUserPlus } from "@fortawesome/free-solid-svg-icons";

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

  return (
    <>
      <FormModal label={"Agregar Usuario"} icon={faUserPlus}>
        <h1>Aqui va un formulario</h1>
      </FormModal>
      <SpringDataTable
        data={users}
        columnTitles={columnTitles}
        editModalTitle={"Editar Usuarios"}
      />
    </>
  );
};
