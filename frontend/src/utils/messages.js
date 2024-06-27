import Swal from "sweetalert2";

export const showErrorMessage = (body) => {
  Swal.fire({
    title: "Oops!",
    text: body,
    icon: "error",
    confirmButtonText: "Aceptar",
  });
};
