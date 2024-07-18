import { useApiPaperworks } from "../../hooks";
import { errorProcess, showSuccessMessage } from "../../utils/messages";
import { changeModalState, setLoading } from "../Global";
import { setRentals, setSellings } from "./paperworkSlice";

const {
  createRentalEndpoint,
  createSellingEndpoint,
  deleteRentalEndpoint,
  deleteSellingEndpoint,
  getRentalsEndpoint,
  getSellingsEndpoint,
  editRentalEndpoint,
} = useApiPaperworks();

export const startCreateRental = (paperworkData) => {
  return async (dispatch) => {
    const res = await createRentalEndpoint(paperworkData);
    if (res.status === 201) {
      const { data } = res;
      dispatch(setRentals(data.data));
      dispatch(changeModalState());
      dispatch(setLoading(false));
      showSuccessMessage("Renta creada con éxito");
      return;
    }
    errorProcess(res, dispatch);
  };
};

export const startCreateSelling = (paperworkData) => {
  return async (dispatch) => {
    const res = await createSellingEndpoint(paperworkData);
    if (res.status === 201) {
      const { data } = res;
      dispatch(setSellings(data.data));
      dispatch(changeModalState());
      dispatch(setLoading(false));
      showSuccessMessage("Venta creada con éxito");
      return;
    }
    errorProcess(res, dispatch);
  };
};

export const startDeleteRental = (paperworkData) => {
  return async (dispatch) => {
    const res = await deleteRentalEndpoint(paperworkData);
    if (res.status === 201) {
      const { data } = res;
      dispatch(setRentals(data.data));
      dispatch(setLoading(false));
      showSuccessMessage("Alquiler eliminado con éxito");
      return;
    }
    errorProcess(res, dispatch);
  };
};

export const startDeleteSelling = (paperworkData) => {
  return async (dispatch) => {
    const res = await deleteSellingEndpoint(paperworkData);
    if (res.status === 201) {
      const { data } = res;
      dispatch(setSellings(data.data));
      dispatch(setLoading(false));
      showSuccessMessage("Venta eliminada con éxito");
      return;
    }
    errorProcess(res, dispatch);
  };
};

export const startGetRentals = () => {
  return async (dispatch) => {
    const res = await getRentalsEndpoint();
    if (res.status === 201) {
      const { data } = res;
      dispatch(setRentals(data.data));
      dispatch(setLoading(false));
      return;
    }
    errorProcess(res, dispatch);
  };
};

export const startGetSellings = () => {
  return async (dispatch) => {
    const res = await getSellingsEndpoint();
    if (res.status === 201) {
      const { data } = res;
      dispatch(setSellings(data.data));
      dispatch(setLoading(false));
      return;
    }
    errorProcess(res, dispatch);
  };
};

export const startEditRental = (rentalInfo) => {
  return async (dispatch) => {
    const res = await editRentalEndpoint(rentalInfo);
    if (res.status === 201) {
      const { data } = res;
      dispatch(setRentals(data.data));
      dispatch(setLoading(false));
      dispatch(changeModalState());
      showSuccessMessage("Alquiler actualizado con éxito");
      return;
    }
    errorProcess(res, dispatch);
  };
};
