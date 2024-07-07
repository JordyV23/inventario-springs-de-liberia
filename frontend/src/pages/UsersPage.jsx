import React, { useEffect } from "react";
import { useActionsUsers } from "../hooks";
import { useSelector } from "react-redux";
import { FormModal, SpringDataTable } from "../components";

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
      <FormModal />
      <SpringDataTable data={users} columnTitles={columnTitles} />
    </>
  );
};
