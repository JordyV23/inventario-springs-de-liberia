import React, { useEffect } from "react";
import { ReportCard } from "../components/ReportCard";
import { reportData } from "../data/reportData";
import { useActionsReports, usePdfReport } from "../hooks";
import { FormModal, SpringForm } from "../components";
import { useSelector } from "react-redux";
import { clearFormReport } from "../store";
import {
  RentalReportByAssetFields,
  RentalReportByDateFields,
  SellingReportByDateFields,
  UnfinishedMaintenancesReportFields,
} from "../data/forms/reportsFormFields";
import Swal from "sweetalert2";
import { showErrorMessage } from "../utils/messages";

export const ReportsPage = () => {
  const {
    reportMode,
    reportData: reportInfo,
    reportTitle,
  } = useSelector((state) => state.reports);
  const { assets } = useSelector((state) => state.inventory);

  const assetsOptions = assets.map((asset) => {
    return { value: asset.idAsset, label: asset.nombre };
  });

  const { generatePdf } = usePdfReport();

  useEffect(() => {
    if (reportInfo.length > 0) {
      generatePdf(reportTitle, reportInfo);
    } else {
      showErrorMessage("No hay datos para mostrar")
    }
  }, [reportInfo]);

  const {
    makeRentalReportByAsset,
    makeRentalReportByDate,
    makeSellingReportByDate,
    makeUnfinishedMaintenancesReport,
  } = useActionsReports();

  RentalReportByAssetFields[0].fieldOptions = assetsOptions;
  UnfinishedMaintenancesReportFields[0].fieldOptions = assetsOptions;

  const reportTypeFunction = {
    RD: { fnc: makeRentalReportByDate, fields: RentalReportByDateFields },
    RA: { fnc: makeRentalReportByAsset, fields: RentalReportByAssetFields },
    SD: { fnc: makeSellingReportByDate, fields: SellingReportByDateFields },
    UM: {
      fnc: makeUnfinishedMaintenancesReport,
      fields: UnfinishedMaintenancesReportFields,
    },
  };

  return (
    <>
      <FormModal
        showBtn={false}
        clearFunction={clearFormReport}
        label={"Generar Reporte"}
        creationFunction={reportTypeFunction[reportMode].fnc}
      >
        <SpringForm fields={reportTypeFunction[reportMode].fields} />
      </FormModal>
      <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-2 gap-3 p-4">
        {reportData.map((report, i) => (
          <ReportCard key={i} reportData={report} />
        ))}
      </div>
    </>
  );
};
