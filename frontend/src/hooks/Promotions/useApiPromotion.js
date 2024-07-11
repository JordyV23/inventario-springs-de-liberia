import backendApi from "../../api/backend-api";

export const useApiPromotion = () => {
  const createPromotionEndpoint = async (promotion) => {
    try {
      const response = await backendApi.promociones.post(
        "/crearPublicidad",
        promotion
      );
      return response;
    } catch (error) {
      return error;
    }
  };

  const getPromotionEndpoint = async () => {
    try {
      const response = await backendApi.promociones.get("/listarPublicidad");
      return response;
    } catch (error) {
      return error;
    }
  };

  const updatePromotionEndpoint = async (promotion) => {
    try {
      const response = await backendApi.promociones.post(
        "/editarPublicidad",
        promotion
      );
      return response;
    } catch (error) {
      return error;
    }
  };

  const deletePromotionEndpoint = async (promotion) => {
    try {
      const response = await backendApi.promociones.post(
        "/borrarPublicidad",
        promotion
      );
      return response;
    } catch (error) {
      return error;
    }
  };

  return {
    createPromotionEndpoint,
    getPromotionEndpoint,
    updatePromotionEndpoint,
    deletePromotionEndpoint,
  };
};
