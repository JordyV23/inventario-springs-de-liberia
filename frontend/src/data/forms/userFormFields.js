import { faExclamationCircle, faIdCard, faUser, faUserPen } from "@fortawesome/free-solid-svg-icons";
import { faAt } from "@fortawesome/free-solid-svg-icons/faAt";
import { faKey } from "@fortawesome/free-solid-svg-icons/faKey";
import { faPhoneVolume } from "@fortawesome/free-solid-svg-icons/faPhoneVolume";
import {
  writeCedula,
  writeNombre,
  writeTelefono,
  writeCorreo,
  writeUsername,
  writePassword,
  writeRol,
} from "../../store/User";
import { roleOptions } from "../mapings";

export const loginFields = () => {
  const usernameInput = {
    id: "username",
    label: "Nombre de Usuario",
    icon: faUser,
    type: "text",
    placeholder: "user1234",
    write: writeUsername,
    editable: false,
    stateName: "users",
    fieldType:"InputFiled"
  };

  const passwordInput = {
    id: "password",
    label: "Contraseña",
    icon: faKey,
    type: "password",
    placeholder: "••••••••",
    write: writePassword,
    editable: false,
    stateName: "users",
    fieldType:"InputFiled"
  };

  return {
    passwordInput,
    usernameInput,
  };
};

export const selRegisterFields = [
  {
    id: "cedula",
    label: "Cédula",
    icon: faIdCard,
    type: "text",
    placeholder: "111230456",
    write: writeCedula,
    editable: false,
    stateName: "users",
    fieldType:"InputFiled"
  },
  {
    id: "nombre",
    label: "Nombre Completo",
    icon: faUserPen,
    type: "text",
    placeholder: "Nombre Apellidos ",
    write: writeNombre,
    editable: false,
    stateName: "users",
    fieldType:"InputFiled"
  },
  {
    id: "telefono",
    label: "Número de telefono",
    icon: faPhoneVolume,
    type: "text",
    placeholder: "Número de teléfono",
    write: writeTelefono,
    editable: false,
    stateName: "users",
    fieldType:"InputFiled"
  },
  {
    id: "correo",
    label: "Correo electrónico",
    icon: faAt,
    type: "email",
    placeholder: "ejemplo@algo.com",
    write: writeCorreo,
    editable: false,
    stateName: "users",
    fieldType:"InputFiled"
  },
  {
    id: "password",
    label: "Contraseña",
    icon: faKey,
    type: "password",
    placeholder: "••••••••",
    write: writePassword,
    editable: false,
    stateName: "users",
    fieldType:"InputFiled"
  },
];


export const registerFields = [
  {
    id: "cedula",
    label: "Cédula",
    icon: faIdCard,
    type: "text",
    placeholder: "111230456",
    write: writeCedula,
    editable: false,
    stateName: "users",
    fieldType:"InputFiled"
  },
  {
    id: "nombre",
    label: "Nombre Completo",
    icon: faUserPen,
    type: "text",
    placeholder: "Nombre Apellidos ",
    write: writeNombre,
    editable: false,
    stateName: "users",
    fieldType:"InputFiled"
  },
  {
    id: "telefono",
    label: "Número de telefono",
    icon: faPhoneVolume,
    type: "text",
    placeholder: "Número de teléfono",
    write: writeTelefono,
    editable: false,
    stateName: "users",
    fieldType:"InputFiled"
  },
  {
    id: "correo",
    label: "Correo electrónico",
    icon: faAt,
    type: "email",
    placeholder: "ejemplo@algo.com",
    write: writeCorreo,
    editable: false,
    stateName: "users",
    fieldType:"InputFiled"
  },
  {
    id: "rol",
    label: "Rol de Usuario",
    icon: faExclamationCircle,
    type: "text",
    placeholder: "Rol del usuario",
    write: writeRol,
    editable: false,
    stateName: "users",
    fieldType:"SelectField",
    fieldOptions: roleOptions
  },
  {
    id: "password",
    label: "Contraseña",
    icon: faKey,
    type: "password",
    placeholder: "••••••••",
    write: writePassword,
    editable: false,
    stateName: "users",
    fieldType:"InputFiled"
  },
]