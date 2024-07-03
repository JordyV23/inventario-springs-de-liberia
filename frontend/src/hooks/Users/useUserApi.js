import backendApi from "../../api/backend-api";

export const useApiUsers = () => {
  const logInEndpoint = async (user) => {
    try {
      const response = await backendApi.personas.post("/iniciarSesion", user);
      return response;
    } catch (error) {
      return error;
    }
  };

  const selfRegisterEndpoint = async (user) => {
    try {
      const response = await backendApi.personas.post(
        "/registrarPersona",
        user
      );
      return response;
    } catch (error) {
      return error;
    }
  };

  return {
    logInEndpoint,
    selfRegisterEndpoint,
  };
};
