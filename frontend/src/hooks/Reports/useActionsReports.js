import { useDispatch, useSelector } from "react-redux";
import { setLoading } from "../../store";

import {
  startGetRentalReport,
  startGetRentalReportByProperty,
  startGetSellingReport,
  startGetReportUnfinishedMaintenances,
} from "../../store";

export const useActionsReports = () => {
  const dispatch = useDispatch();

  const { idAsset, mes, year } = useSelector((state) => state.reports);

  const makeRentalReportByAsset = () => {
    dispatch(setLoading(true));
    dispatch(startGetRentalReportByProperty({ idAsset }));
  };

  const makeSellingReportByDate = () => {
    dispatch(setLoading(true));
    dispatch(startGetSellingReport({ year, mes }));
  };

  const makeRentalReportByDate = () => {
    dispatch(setLoading(true));
    dispatch(startGetRentalReport({ year, mes }));
  };

  const makeUnfinishedMaintenancesReport = () => {
    dispatch(setLoading(true));
    dispatch(startGetReportUnfinishedMaintenances({ idAsset }));
  };

  return {
    makeRentalReportByAsset,
    makeSellingReportByDate,
    makeRentalReportByDate,
    makeUnfinishedMaintenancesReport,
  };
};
