import backendApi from "../../api/backend-api";

export const ApiUsers = () => {
  const createSelling = async (paperworkInfo) => {
    try {
      const response = await backendApi.tramites.post("/vender", paperworkInfo);
      return response;
    } catch (error) {
      return error;
    }
  };

  const getSellings = async () => {
    try {
      const response = await backendApi.tramites.get("/listarVentas");
      return response;
    } catch (error) {
      return error;
    }
  };

  const deleteSelling = async (paperworkInfo) => {
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

  const getRentals = async () => {
    try {
      const response = await backendApi.tramites.get("/listarAlquileres");
      return response;
    } catch (error) {
      return error;
    }
  };

  const createRental = async (paperworkInfo) => {
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

  const deleteRental = async (paperworkInfo) => {
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
    createSelling,
    getSellings,
    deleteSelling,
    getRentals,
    createRental,
    deleteRental,
  };
};
