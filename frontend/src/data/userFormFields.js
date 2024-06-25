import { faIdCard, faUser, faUserPen } from "@fortawesome/free-solid-svg-icons";
import { faAt } from "@fortawesome/free-solid-svg-icons/faAt";
import { faKey } from "@fortawesome/free-solid-svg-icons/faKey";
import { faPhoneVolume } from "@fortawesome/free-solid-svg-icons/faPhoneVolume";

export const loginFields = () => {
  const usernameInput = {
    id: "username",
    label: "Nombre de Usuario",
    icon: faUser,
    type: "text",
    placeholder: "user1234",
  };

  const passwordInput = {
    id: "password",
    label: "Contraseña",
    icon: faKey,
    type: "password",
    placeholder: "••••••••",
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
  },
  {
    id: "NombreCompleto",
    label: "Nombre Completo",
    icon: faUserPen,
    type: "text",
    placeholder: "Nombre Apellidos ",
  },
  {
    id: "telefono",
    label: "Número de telefono",
    icon: faPhoneVolume,
    type: "text",
    placeholder: "Número de teléfono",
  },
  {
    id: "email",
    label: "Correo electrónico",
    icon: faAt,
    type: "email",
    placeholder: "ejemplo@algo.com",
  },
  {
    id: "username",
    label: "Usuario",
    icon: faUser,
    type: "text",
    placeholder: "",
  },
  {
    id: "password",
    label: "Contraseña",
    icon: faKey,
    type: "password",
    placeholder: "••••••••",
  },
];
