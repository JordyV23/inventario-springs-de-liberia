import { useDispatch, useSelector } from "react-redux";
import { setLoading } from "../../store";
import {
  startLogInUser,
  startSelfRegisterUser,
} from "../../store/User/userThunk";
import { roles } from "../../data";

export const useActionsUsers = () => {
  const dispatch = useDispatch();

  const { username, password, cedula, nombre, telefono, correo } = useSelector(
    (state) => state.users
  );

  const makeLogin = () => {
    dispatch(setLoading(true));
    dispatch(startLogInUser({ username, password }));
  };

  const makeSelfRegister = () => {
    dispatch(setLoading(true));
    dispatch(
      startSelfRegisterUser({
        cedula,
        nombreCompleto: nombre,
        telefono,
        correo,
        password,
        rol: roles[3],
      })
    );
  };

  return {
    makeLogin,
    makeSelfRegister,
  };
};
