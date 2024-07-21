import { faCalendarDay, faCashRegister, faHouseChimneyCrack, faHouseFlag } from "@fortawesome/free-solid-svg-icons";

export const reportData = [
  {
    label: "Reporte de Rentas por fecha",
    icon: faCalendarDay,
    description: "Muestra un reporte en PDF sobre todas las rentas que coincidan con una fecha ingresada",
    function: "",
  },
  {
    label: "Reporte de Rentas por propiedad",
    icon: faHouseFlag,
    description: "Muestra un reporte en PDF sobre todas las rentas que coincidan con el activo seleccionado",
    function: "",
  },
  {
    label: "Reporte de Ventas por fecha",
    icon: faCashRegister,
    description: "Muestra un reporte en PDF sobre todas las ventas que coincidan con una fecha ingresada",
    function: "",
  },
  {
    label: "Reporte de Mantenimientos Pendientes",
    icon: faHouseChimneyCrack,
    description: "Muestra un reporte en PDF sobre todos los mantenimientos pendientes",
    function: "",
  },
];
