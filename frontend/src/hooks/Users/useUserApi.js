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

  return {
    logInEndpoint,
  };
};
