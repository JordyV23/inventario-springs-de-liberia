import { useApiUsers } from "../../hooks/Users/useUserApi";
import { showErrorMessage, showSuccessMessage } from "../../utils/messages";
import { changeModalState, setLoading, setUserAsLogged } from "../Global";
import { clearForm, setUsers } from "./usersSlice";

const {
  logInEndpoint,
  registerEndpoint,
  getUsersEndpoint,
  updateUserEndpoint,
  deleteUserEndpoint,
} = useApiUsers();

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
    const res = await registerEndpoint(user);
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

export const startGetUsers = () => {
  return async (dispatch) => {
    const res = await getUsersEndpoint();
    if (res.status === 200) {
      dispatch(setUsers(res.data.data));
      dispatch(setLoading(false));
      return;
    }
    errorProcess(res, dispatch);
  };
};

export const startRegisterUser = (user) => {
  return async (dispatch) => {
    const res = await registerEndpoint(user);
    if (res.status === 201) {
      showSuccessMessage("Usuario registrado exitosamente");
      dispatch(setUsers(res.data.data));
      dispatch(setLoading(false));
      dispatch(changeModalState());
      dispatch(clearForm());
      return;
    }

    errorProcess(res, dispatch);
  };
};

export const startEditUser = (user) => {
  return async (dispatch) => {
    const res = await updateUserEndpoint(user);
    if (res.status === 201) {
      dispatch(setUsers(res.data.data));
      showSuccessMessage("Usuario editado exitosamente");
      dispatch(setLoading(false));
      dispatch(changeModalState());
      dispatch(clearForm());
      return;
    }

    errorProcess(res, dispatch);
  };
};

export const startDeleteUser = (user) => {
  return async (dispatch) => {
    const res = await deleteUserEndpoint(user);
    if (res.status === 201) {
      dispatch(setUsers(res.data.data));
      showSuccessMessage("Usuario eliminado exitosamente");
      dispatch(setLoading(false));
      dispatch(clearForm());
      return;
    }

    errorProcess(res, dispatch);
  };
};
