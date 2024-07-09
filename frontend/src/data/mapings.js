// A - Administrador, F - Funcionario , O - Operario, C - Cliente
export const roles = ["A", "F", "O", "C"];

export const roleOptions = [
    { value: roles[3], label: "Cliente" },
  { value: roles[0], label: "Administrador" },
  { value: roles[1], label: "Funcionario" },
  { value: roles[2], label: "Operario" },
];

export const privileged = [roles[0], roles[1]]; // Modulo Usuarios

export const restricted = [roles[0], roles[1], roles[0]]; // Modulo de tramites

export const complete = [roles[0], roles[1], roles[2], roles[3]]; // Modulo de activos y Mantenimientos
