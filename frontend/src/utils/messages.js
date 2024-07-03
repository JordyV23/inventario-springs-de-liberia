import Swal from "sweetalert2";

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
