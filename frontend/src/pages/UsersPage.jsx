import React, { useEffect } from "react";
import { useActionsUsers } from "../hooks";
import { useSelector } from "react-redux";
import { SpringDataTable } from "../components/SpringDataTable";
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
    ""
  ];

  useEffect(() => {
    makeGetUsers()
  }, [])
  

  return (
    <>
      <SpringDataTable
        data={users}
        columnTitles={columnTitles}
      />
    </>
  );
};
