import backendApi from "../../api/backend-api";

export const useApiReports = () => {
  const rentalReportByDateEndpoint = async (reportProps) => {
    try {
      const response = await backendApi.reportes.post(
        "/rentalReportByDate",
        reportProps
      );
      return response;
    } catch (error) {
      return error;
    }
  };

  const rentalReportByAssetEndpoint = async (reportProps) => {
    try {
      const response = await backendApi.reportes.post(
        "/rentalReportByAsset",
        reportProps
      );
      return response;
    } catch (error) {
      return error;
    }
  };

  const sellingReportByDateEndpoint = async (reportProps) => {
    try {
      const response = await backendApi.reportes.post(
        "/sellingReportByDate",
        reportProps
      );
      return response;
    } catch (error) {
      return error;
    }
  };

  const unfinishedMaintenancesReportEndpoint = async (reportProps) => {
    try {
      const response = await backendApi.reportes.post(
        "/unfinishedMaintenancesReport",
        reportProps
      );
      return response;
    } catch (error) {
      return error;
    }
  };

  return {
    rentalReportByDateEndpoint,
    rentalReportByAssetEndpoint,
    sellingReportByDateEndpoint,
    unfinishedMaintenancesReportEndpoint,
  };
};
