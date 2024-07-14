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

// A-Activo, C-Casa , T-Terreno ,E-Edificio
export const assetsTypes = ["A", "C", "T", "E"];

export const assetsTypesOptions = [
  { value: assetsTypes[0], label: "Activo" },
  { value: assetsTypes[1], label: "Casa" },
  { value: assetsTypes[2], label: "Terreno" },
  { value: assetsTypes[3], label: "Edificio" },
];

//  V-Venta, A-Alquiler
export const availabilityTypes = ["V", "A"];

export const availabilityTypesOptions = [
  { value: availabilityTypes[0], label: "Venta" },
  { value: availabilityTypes[1], label: "Alquiler" },
];

export const provincias = [
  { value: "1", label: "San José" },
  { value: "2", label: "Alajuela" },
  { value: "3", label: "Cartago" },
  { value: "4", label: "Heredia" },
  { value: "5", label: "Guanacaste" },
  { value: "6", label: "Punterenas" },
  { value: "7", label: "Limón" },
];

export const distritos = [
  { value: "Carmen", label: "Carmen" },
  { value: "Merced", label: "Merced" },
  { value: "Hospital", label: "Hospital" },
  { value: "Catedral", label: "Catedral" },
  { value: "Zapote", label: "Zapote" },
  { value: "San Francisco de Dos Ríos", label: "San Francisco de Dos Ríos" },
  { value: "Uruca", label: "Uruca" },
  { value: "Mata Redonda", label: "Mata Redonda" },
  { value: "Pavas", label: "Pavas" },
  { value: "Hatillo", label: "Hatillo" },
  { value: "San Sebastián", label: "Carmen" },
];

export const cantones = [
  { value: "1", label: "San José" },
  { value: "2", label: "Escazú" },
  { value: "3", label: "Desamparados" },
  { value: "4", label: "Puriscal" },
  { value: "5", label: "Tarrazú" },
  { value: "6", label: "Aserrí" },
  { value: "7", label: "Mora" },
  { value: "8", label: "Goicoechea" },
  { value: "9", label: "Santa Ana" },
  { value: "10", label: "Alajuelita" },
  { value: "11", label: "Vázquez De Coronado" },
  { value: "12", label: "Acosta" },
  { value: "13", label: "Tibás" },
  { value: "14", label: "Moravia" },
  { value: "15", label: "Montes De Oca" },
  { value: "16", label: "Turrubares" },
  { value: "17", label: "Dota" },
  { value: "18", label: "Curridabat" },
  { value: "19", label: "Pérez Zeledón" },
  { value: "20", label: "León Cortés Castro" },
  { value: "21", label: "Alajuela" },
  { value: "22", label: "San Ramón" },
  { value: "23", label: "Grecia" },
  { value: "24", label: "San Mateo" },
  { value: "25", label: "Atenas" },
  { value: "26", label: "Naranjo" },
  { value: "27", label: "Palmares" },
  { value: "28", label: "Poás" },
  { value: "29", label: "Orotina" },
  { value: "30", label: "San Carlos" },
  { value: "31", label: "Zarcero" },
  { value: "32", label: "Sarchí" },
  { value: "33", label: "Upala" },
  { value: "34", label: "Los Chiles" },
  { value: "35", label: "Guatuso" },
  { value: "36", label: "Río Cuarto" },
  { value: "37", label: "Cartago" },
  { value: "38", label: "Paraíso" },
  { value: "39", label: "La Unión" },
  { value: "40", label: "Jiménez" },
  { value: "41", label: "Turrialba" },
  { value: "42", label: "Alvarado" },
  { value: "43", label: "Oreamuno" },
  { value: "44", label: "El Guarco" },
  { value: "45", label: "Heredia" },
  { value: "46", label: "Barva" },
  { value: "47", label: "Santo Domingo" },
  { value: "48", label: "Santa Barbara" },
  { value: "49", label: "San Rafael" },
  { value: "50", label: "San Isidro" },
  { value: "51", label: "Belén" },
  { value: "52", label: "Flores" },
  { value: "53", label: "San Pablo" },
  { value: "54", label: "Sarapiquí" },
  { value: "55", label: "Liberia" },
  { value: "56", label: "Nicoya" },
  { value: "57", label: "Santa Cruz" },
  { value: "58", label: "Bagaces" },
  { value: "59", label: "Carrillo" },
  { value: "60", label: "Cañas" },
  { value: "61", label: "Abangares" },
  { value: "62", label: "Tilarán" },
  { value: "63", label: "Nandayure" },
  { value: "64", label: "La Cruz" },
  { value: "65", label: "Hojancha" },
  { value: "66", label: "Puntarenas" },
  { value: "67", label: "Esparza" },
  { value: "68", label: "Buenos Aires" },
  { value: "69", label: "Montes De Oro" },
  { value: "70", label: "Osa" },
  { value: "71", label: "Quepos" },
  { value: "72", label: "Golfito" },
  { value: "73", label: "Coto Brus" },
  { value: "74", label: "Parrita" },
  { value: "75", label: "Corredores" },
  { value: "76", label: "Garabito" },
  { value: "77", label: "Monteverde" },
  { value: "78", label: "Limón" },
  { value: "79", label: "Pococí" },
  { value: "80", label: "Siquirres" },
  { value: "81", label: "Talamanca" },
  { value: "82", label: "Matina" },
  { value: "83", label: "Guácimo" },
];
