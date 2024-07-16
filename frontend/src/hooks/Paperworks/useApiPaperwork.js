import backendApi from "../../api/backend-api";

export const useApiPaperworks = () => {
  const createSellingEndpoint = async (paperworkInfo) => {
    try {
      const response = await backendApi.tramites.post("/vender", paperworkInfo);
      return response;
    } catch (error) {
      return error;
    }
  };

  const getSellingsEndpoint = async () => {
    try {
      const response = await backendApi.tramites.get("/listarVentas");
      return response;
    } catch (error) {
      return error;
    }
  };

  const deleteSellingEndpoint = async (paperworkInfo) => {
    try {
      const response = await backendApi.tramites.post(
        "/borrarVenta",
        paperworkInfo
      );
      return response;
    } catch (error) {
      return error;
    }
  };

  const getRentalsEndpoint = async () => {
    try {
      const response = await backendApi.tramites.get("/listarAlquileres");
      return response;
    } catch (error) {
      return error;
    }
  };

  const createRentalEndpoint = async (paperworkInfo) => {
    try {
      const response = await backendApi.tramites.post(
        "/alquilar",
        paperworkInfo
      );
      return response;
    } catch (error) {
      return error;
    }
  };

  const deleteRentalEndpoint = async (paperworkInfo) => {
    try {
      const response = await backendApi.tramites.post(
        "/borrarAlquiler",
        paperworkInfo
      );
      return response;
    } catch (error) {
      return error;
    }
  };

  return {
    createSellingEndpoint,
    getSellingsEndpoint,
    deleteSellingEndpoint,
    getRentalsEndpoint,
    createRentalEndpoint,
    deleteRentalEndpoint,
  };
};
