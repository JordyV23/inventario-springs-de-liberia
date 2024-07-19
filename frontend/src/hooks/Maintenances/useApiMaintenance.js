import backendApi from "../../api/backend-api";

export const useApiMaintenance = () => {
  const createMaintenanceEndpoint = async (maintenance) => {
    try {
      const response = await backendApi.mantenimientos.post(
        "/crearMantenimiento",
        maintenance
      );
      return response;
    } catch (error) {
      return error;
    }
  };

  const getMaintenanceEndpoint = async () => {
    try {
      const response = await backendApi.mantenimientos.get(
        "/listarMantenimientos"
      );
      return response;
    } catch (error) {
      return error;
    }
  };

  const closeMaintenanceEndpoint = async (maintenance) => {
    try {
      const response = await backendApi.mantenimientos.post(
        "/terminarMantenimiento",
        maintenance
      );
      return response;
    } catch (error) {
      return error;
    }
  };

  const deleteMaintenanceEndpoint = async (maintenance) => {
    try {
      const response = await backendApi.mantenimientos.post(
        "/borrarMantenimientos",
        maintenance
      );
      return response;
    } catch (error) {
      return error;
    }
  };

  return {
    createMaintenanceEndpoint,
    getMaintenanceEndpoint,
    closeMaintenanceEndpoint,
    deleteMaintenanceEndpoint,
  };
};
