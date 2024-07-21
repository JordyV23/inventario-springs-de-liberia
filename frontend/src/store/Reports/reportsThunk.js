import { useApiReports } from "../../hooks";
import { errorProcess } from "../../utils/messages";
import { setLoading } from "../Global";
import { setReportData } from "./reportsSlice";

const {
  rentalReportByAssetEndpoint,
  sellingReportByDateEndpoint,
  rentalReportByDateEndpoint,
  unfinishedMaintenancesReportEndpoint,
} = useApiReports();

export const startGetRentalReport = (reportParams) => {
  return async (dispatch) => {
    const res = await rentalReportByDateEndpoint(reportParams);
    if (res.status === 201) {
      const { data } = res;
      dispatch(setReportData(data.data));
      dispatch(setLoading(false));
      return;
    }
    errorProcess(res, dispatch);
  };
};

export const startGetSellingReport = (reportParams) => {
  return async (dispatch) => {
    const res = await sellingReportByDateEndpoint(reportParams);
    if (res.status === 201) {
      const { data } = res;
      dispatch(setReportData(data.data));
      dispatch(setLoading(false));
      return;
    }
    errorProcess(res, dispatch);
  };
};

export const startGetRentalReportByProperty = (reportParams) => {
  return async (dispatch) => {
    const res = await rentalReportByAssetEndpoint(reportParams);
    if (res.status === 201) {
      const { data } = res;
      dispatch(setReportData(data.data));
      dispatch(setLoading(false));
      return;
    }
    errorProcess(res, dispatch);
  };
};

export const startGetReportUnfinishedMaintenances = (reportParams) => {
  return async (dispatch) => {
    const res = await unfinishedMaintenancesReportEndpoint(reportParams);
    if (res.status === 201) {
      const { data } = res;
      dispatch(setReportData(data.data));
      dispatch(setLoading(false));
      return;
    }
    errorProcess(res, dispatch);
  };
};
