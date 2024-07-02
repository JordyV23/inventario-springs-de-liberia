import { faIdCard, faUser, faUserPen } from "@fortawesome/free-solid-svg-icons";
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
} from "../../store/User";

export const loginFields = () => {
  const usernameInput = {
    id: "username",
    label: "Nombre de Usuario",
    icon: faUser,
    type: "text",
    placeholder: "user1234",
    write: writeUsername,
  };

  const passwordInput = {
    id: "password",
    label: "Contraseña",
    icon: faKey,
    type: "password",
    placeholder: "••••••••",
    write: writePassword,
  };

  return {
    passwordInput,
    usernameInput,
  };
};

export const registerFields = [
  {
    id: "cedula",
    label: "Cédula",
    icon: faIdCard,
    type: "text",
    placeholder: "111230456",
    write: writeCedula,
  },
  {
    id: "NombreCompleto",
    label: "Nombre Completo",
    icon: faUserPen,
    type: "text",
    placeholder: "Nombre Apellidos ",
    write: writeNombre,
  },
  {
    id: "telefono",
    label: "Número de telefono",
    icon: faPhoneVolume,
    type: "text",
    placeholder: "Número de teléfono",
    write: writeTelefono,
  },
  {
    id: "email",
    label: "Correo electrónico",
    icon: faAt,
    type: "email",
    placeholder: "ejemplo@algo.com",
    write: writeCorreo,
  },
  {
    id: "username",
    label: "Usuario",
    icon: faUser,
    type: "text",
    placeholder: "",
    write: writeUsername,
  },
  {
    id: "password",
    label: "Contraseña",
    icon: faKey,
    type: "password",
    placeholder: "••••••••",
    write: writePassword,
  },
];
