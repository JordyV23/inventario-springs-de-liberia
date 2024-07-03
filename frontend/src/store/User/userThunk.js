import { useApiUsers } from "../../hooks/Users/useUserApi";
import { showErrorMessage, showSuccessMessage } from "../../utils/messages";
import { setLoading, setUserAsLogged } from "../Global";
import { clearForm } from "./usersSlice";

const { logInEndpoint, selfRegisterEndpoint } = useApiUsers();

const errorProcess = (res, dispatch) => {
  dispatch(setLoading(false));
  showErrorMessage(res.response.data.data);
};

export const startLogInUser = (user) => {
  return async (dispatch) => {
    const res = await logInEndpoint(user);
    if (res.status === 200) {
      const { data } = res;
      dispatch(setUserAsLogged(data.data));
      dispatch(setLoading(false));
      return;
    }
    errorProcess(res, dispatch);
    // console.log(res.data.data);
  };
};

export const startSelfRegisterUser = (user) => {
  return async (dispatch) => {
    const res = await selfRegisterEndpoint(user);
    if (res.status === 201) {
      showSuccessMessage(
        "Por favor revise su correo electronico, en donde debe de haber recibido su usuario para ingresar a la aplicación"
      );
      dispatch(setLoading(false));
      dispatch(clearForm());
      return;
    }

    errorProcess(res, dispatch);
  };
};
