import Swal from "sweetalert2";
import { setLoading } from "../store";

export const showErrorMessage = (body) => {
  Swal.fire({
    title: "Oops!",
    text: body,
    icon: "error",
    confirmButtonText: "Aceptar",
  });
};

export const showSuccessMessage = (body) => {
  Swal.fire({
    title: "Acción Exitosa!",
    text: body,
    icon: "success",
    confirmButtonText: "Aceptar",
  });
};

export const errorProcess = (res, dispatch) => {
  dispatch(setLoading(false));
  showErrorMessage(res.response.data.data);
};