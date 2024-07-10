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

  const registerEndpoint = async (user) => {
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

  const getUsersEndpoint = async () => {
    try {
      const response = await backendApi.personas.get("/getPersonas");
      return response;
    } catch (error) {
      return error;
    }
  };

  const updateUserEndpoint = async (user) => {
    try {
      const response = await backendApi.personas.post("/editarPersona", user);
      return response;
    } catch (error) {
      return error;
    }
  };

  const deleteUserEndpoint = async (user) => {
    try {
      const response = await backendApi.personas.post("/eliminarPersona", user);
      return response;
    } catch (error) {
      return error;
    }
  };

  return {
    logInEndpoint,
    registerEndpoint,
    getUsersEndpoint,
    updateUserEndpoint,
    deleteUserEndpoint,
  };
};
