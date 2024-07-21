import React from "react";
import { ReportCard } from "../components/ReportCard";
import { reportData } from "../data/reportData";
import { useActionsReports } from "../hooks";
import { FormModal, SpringForm } from "../components";
import { useSelector } from "react-redux";
import { clearFormReport } from "../store";
import {
  RentalReportByAssetFields,
  RentalReportByDateFields,
  SellingReportByDateFields,
  UnfinishedMaintenancesReportFields,
} from "../data/forms/reportsFormFields";

export const ReportsPage = () => {
  const { reportMode } = useSelector((state) => state.reports);
  const { assets } = useSelector((state) => state.inventory);

  const assetsOptions = assets.map((asset) => {
    return { value: asset.idAsset, label: asset.nombre };
  });

  const {
    makeRentalReportByAsset,
    makeRentalReportByDate,
    makeSellingReportByDate,
    makeUnfinishedMaintenancesReport,
  } = useActionsReports();

  RentalReportByAssetFields[0].fieldOptions = assetsOptions;
  SellingReportByDateFields[0].fieldOptions = assetsOptions;

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
