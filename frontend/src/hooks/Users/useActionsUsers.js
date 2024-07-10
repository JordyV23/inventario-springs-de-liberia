import { useDispatch, useSelector } from "react-redux";
import { setLoading } from "../../store";
import {
  startDeleteUser,
  startEditUser,
  startGetUsers,
  startLogInUser,
  startRegisterUser,
  startSelfRegisterUser,
} from "../../store/User/userThunk";
import { roles } from "../../data";

export const useActionsUsers = () => {
  const dispatch = useDispatch();

  const { idUser, username, password, cedula, nombre, telefono, correo, rol } =
    useSelector((state) => state.users);

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

  const makeGetUsers = () => {
    dispatch(setLoading(true));
    dispatch(startGetUsers());
  };

  const makeRegisterUser = () => {
    dispatch(setLoading(true));
    dispatch(
      startRegisterUser({
        username,
        cedula,
        nombreCompleto: nombre,
        telefono,
        correo,
        password,
        rol,
      })
    );
  };

  const makeEditUser = () => {
    dispatch(setLoading(true));
    dispatch(
      startEditUser({
        id: idUser,
        username,
        cedula,
        nombreCompleto: nombre,
        telefono,
        correo,
        password,
        rol,
      })
    );
  };

  const makeDeleteUser = (id) => {
    dispatch(setLoading(true));
    dispatch(startDeleteUser({ id }));
  };

  return {
    makeLogin,
    makeSelfRegister,
    makeGetUsers,
    makeRegisterUser,
    makeEditUser,
    makeDeleteUser,
  };
};
