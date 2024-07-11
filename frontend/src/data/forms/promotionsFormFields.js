import { faCalendarCheck, faCalendarXmark, faHeading } from "@fortawesome/free-solid-svg-icons";
import { writeDescripcion, writeFechaFin, writeFechaInicio, writeTitulo } from "../../store";
import { faMicroblog } from "@fortawesome/free-brands-svg-icons";

export const promotionRegisterFields = [
  {
    id: "titulo",
    label: "Titulo",
    icon: faHeading,
    type: "text",
    placeholder: "Ingrese el titulo",
    write: writeTitulo,
    editable: false,
    stateName: "promotions",
    fieldType: "InputFiled",
  },
  {
    id: "descripcion",
    label: "Descripción",
    icon: faMicroblog,
    type: "text",
    placeholder: "Ingrese una descripción",
    write: writeDescripcion,
    editable: false,
    stateName: "promotions",
    fieldType: "TextArea",
    stateName: "promotions",
  },
  {
    id: "fechaInicio",
    label: "Fecha de Inicio",
    icon: faCalendarCheck,
    type: "date",
    placeholder: "Ingrese la fecha de inicio",
    write: writeFechaInicio,
    editable: false,
    stateName: "promotions",
    fieldType: "InputFiled",
  },
  {
    id: "fechaFin",
    label: "Fecha de Fin",
    icon: faCalendarXmark,
    type: "date",
    placeholder: "Ingrese la fecha de finalizacion",
    write: writeFechaFin,
    editable: false,
    stateName: "promotions",
    fieldType: "InputFiled",
  },
];
