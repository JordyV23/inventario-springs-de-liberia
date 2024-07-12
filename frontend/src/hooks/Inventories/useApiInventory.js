import backendApi from "../../api/backend-api";

export const useApiInventory = () => {
  const createAsset = async (asset) => {
    try {
      const response = await backendApi.activos.post("/registrarActivo", asset);
      return response;
    } catch (error) {
      return error;
    }
  };
  
  const getAsset = async (asset) => {
    try {
      const response = await backendApi.activos.get("/listarActivos", asset);
      return response;
    } catch (error) {
      return error;
    }
  };

  const updateAsset = async (asset) => {
    try {
      const response = await backendApi.activos.post("/editarActivo", asset);
      return response;
    } catch (error) {
      return error;
    }
  };

  const deleteAsset = async (asset) => {
    try {
      const response = await backendApi.activos.post("/eliminarActivo", asset);
      return response;
    } catch (error) {
      return error;
    }
  };

  return {
    createAsset,
    getAsset,
    updateAsset,
    deleteAsset,
  };
};
