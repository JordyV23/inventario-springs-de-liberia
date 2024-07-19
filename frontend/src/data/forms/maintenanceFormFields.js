import { faBuilding, faHammer } from "@fortawesome/free-solid-svg-icons";
import {
  writeDetalle,
  writeIdAssetMaintenance,
} from "../../store";

export const maintenanceRegisterFields = [
  {
    id: "idAsset",
    label: "Activos",
    icon: faBuilding,
    type: "text",
    placeholder: "Ingrese el activo",
    write: writeIdAssetMaintenance,
    editable: false,
    stateName: "maintenances",
    fieldType: "SelectField",
    fieldOptions: [],
  },
  {
    id: "detalle",
    label: "Averia a reportar",
    icon: faHammer,
    type: "text",
    placeholder: "Ingrese la averia",
    write: writeDetalle,
    editable: false,
    stateName: "maintenances",
    fieldType: "TextArea",
  },
];
