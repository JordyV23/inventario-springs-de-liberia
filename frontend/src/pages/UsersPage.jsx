import React, { useEffect } from "react";
import { useActionsUsers } from "../hooks";
import { useSelector } from "react-redux";
import { FormModal, SpringDataTable, SpringForm } from "../components";
import { faUserPlus } from "@fortawesome/free-solid-svg-icons";
import { registerFields } from "../data";
import { clearForm, loadUserForm } from "../store";

export const UsersPage = () => {
  const { makeGetUsers, makeRegisterUser, makeEditUser, makeDeleteUser } =
    useActionsUsers();
  const { users } = useSelector((state) => state.users);

  const columnTitles = [
    "Cedula",
    "Nombre Completo",
    "Telefono",
    "Correo",
    "Usuario",
    // "Rol",
  ];

  useEffect(() => {
    makeGetUsers();
  }, []);

  const handleCreation = () => {
    makeRegisterUser();
  };

  const handleEdition = () => {
    makeEditUser();
  };

  const handleDelete = (row) => {
    makeDeleteUser(row.idPerson);
  };

  return (
    <>
      <FormModal
        label={"Agregar Usuario"}
        icon={faUserPlus}
        clearFunction={clearForm}
        creationFunction={handleCreation}
        editionFunction={handleEdition}
      >
        <SpringForm fields={registerFields} />
      </FormModal>
      <SpringDataTable
        data={users}
        columnTitles={columnTitles}
        editModalTitle={"Editar Usuarios"}
        editFunction={loadUserForm}
        deleteFunction={handleDelete}
      />
    </>
  );
};
