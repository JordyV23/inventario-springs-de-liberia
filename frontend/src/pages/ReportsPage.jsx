import React from "react";
import { ReportCard } from "../components/ReportCard";
import { reportData } from "../data/reportData";
import { useActionsReports } from "../hooks";
import { FormModal } from "../components";

export const ReportsPage = () => {
  const {
    makeRentalReportByAsset,
    makeRentalReportByDate,
    makeSellingReportByDate,
    makeUnfinishedMaintenancesReport,
  } = useActionsReports();

  reportData[0].function = makeRentalReportByDate;
  reportData[1].function = makeRentalReportByAsset;
  reportData[2].function = makeSellingReportByDate;
  reportData[3].function = makeUnfinishedMaintenancesReport;

  return (
    <>
      <FormModal showBtn={false}>
        <h1>Hola Mundo</h1>
      </FormModal>
      <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-2 gap-3 p-4">
        {reportData.map((report, i) => (
          <ReportCard key={i} reportData={report} />
        ))}
      </div>
    </>
  );
};
