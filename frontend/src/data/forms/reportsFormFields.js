import { faBuilding, faCalendarCheck } from "@fortawesome/free-solid-svg-icons";
import { writeFechaReporte, writeIdAssetReport } from "../../store";

export const RentalReportByDateFields = [
  {
    id: "fechaInicio",
    label: "Ingrese el mes para generar el reporte",
    icon: faCalendarCheck,
    type: "month",
    placeholder: "Ingrese el mes para generar el reporte",
    write: writeFechaReporte,
    editable: false,
    stateName: "reports",
    fieldType: "InputFiled",
  },
];

export const RentalReportByAssetFields = [
  {
    id: "idAsset",
    label: "Seleccione el activo",
    icon: faBuilding,
    type: "text",
    placeholder: "Seleccione el activo",
    write: writeIdAssetReport,
    editable: false,
    stateName: "reports",
    fieldType: "SelectField",
    fieldOptions: [],
  },
];

export const SellingReportByDateFields = [
  {
    id: "fechaInicio",
    label: "Ingrese el mes para generar el reporte",
    icon: faCalendarCheck,
    type: "month",
    placeholder: "Ingrese el mes para generar el reporte",
    write: writeFechaReporte,
    editable: false,
    stateName: "reports",
    fieldType: "InputFiled",
  },
];

export const UnfinishedMaintenancesReportFields = [
  {
    id: "idAsset",
    label: "Seleccione el activo",
    icon: faBuilding,
    type: "text",
    placeholder: "Seleccione el activo",
    write: writeIdAssetReport,
    editable: false,
    stateName: "reports",
    fieldType: "SelectField",
    fieldOptions: [],
  },
];
