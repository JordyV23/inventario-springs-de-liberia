import { faAlignLeft, faCubes, faEye, faHeading } from "@fortawesome/free-solid-svg-icons";
import { writeDescripcionActivo, writeDisponibilidad, writeImage, writeTipoActivo, writeTituloActivo } from "../../store";
import { roleOptions } from "../mapings";

export const assetRegisterFileds = [
  {
    id: "titulo",
    label: "Titulo",
    icon: faHeading,
    type: "text",
    placeholder: "Ingrese el Nombre del activo",
    write: writeTituloActivo,
    editable: false,
    stateName: "inventory",
    fieldType: "InputFiled",
  },
  {
    id: "descripcion",
    label: "Descripcion del activo",
    icon: faAlignLeft,
    type: "text",
    placeholder: "Ingrese una descripcion atractiva",
    write: writeDescripcionActivo,
    editable: false,
    stateName: "inventory",
    fieldType: "InputFiled",
  },
  {
    id: "tipoActivo",
    label: "Tipo de Activo",
    icon: faCubes,
    type: "text",
    placeholder: "Tipo de Activo",
    write: writeTipoActivo,
    editable: true,
    stateName: "inventory",
    fieldType:"SelectField",
    fieldOptions: roleOptions
  },
  {
    id: "disponibilidad",
    label: "Disponibilidad de Activo",
    icon: faEye,
    type: "text",
    placeholder: "Disponibilidad de Activo",
    write: writeDisponibilidad,
    editable: true,
    stateName: "inventory",
    fieldType:"SelectField",
    fieldOptions: roleOptions
  },

];
