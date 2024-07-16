import { useApiPaperworks } from "../../hooks";
import { errorProcess, showSuccessMessage } from "../../utils/messages";
import { setLoading } from "../Global";
import { setPaperworks } from "./paperworkSlice";

const {
  createRentalEndpoint,
  createSellingEndpoint,
  deleteRentalEndpoint,
  deleteSellingEndpoint,
  getRentalsEndpoint,
  getSellingsEndpoint,
} = useApiPaperworks();

export const startCreateRental = (paperworkData) => {
  return async (dispatch) => {
    const res = createRentalEndpoint(paperworkData);
    if(res.status === 201) {
      const {data} = res;
      dispatch(setPaperworks(data))
      dispatch(setLoading(false))
      showSuccessMessage("Trámite con éxito")
      return;
    }
    errorProcess(res,dispatch)
  }
}

export const startCreateSelling = (paperworkData) => {
  return async (dispatch) => {
    const res = createSellingEndpoint(paperworkData);
    if(res.status === 201) {
      const {data} = res;
      dispatch(setPaperworks(data))
      dispatch(setLoading(false))
      showSuccessMessage("Trámite con éxito")
      return;
    }
    errorProcess(res,dispatch)
  }
}

export const startDeleteRental = (paperworkData) => {
  return async (dispatch) => {
    const res = deleteRentalEndpoint(paperworkData);
    if(res.status === 201) {
      const {data} = res;
      dispatch(setPaperworks(data))
      dispatch(setLoading(false))
      showSuccessMessage("Trámite con éxito")
      return;
    }
    errorProcess(res,dispatch)
  }
}

export const startDeleteSelling = (paperworkData) => {
  return async (dispatch) => {
    const res = deleteSellingEndpoint(paperworkData);
    if(res.status === 201) {
      const {data} = res;
      dispatch(setPaperworks(data))
      dispatch(setLoading(false))
      showSuccessMessage("Trámite con éxito")
      return;
    }
    errorProcess(res,dispatch)
  }
}

export const startGetRentals = () => {
  return async (dispatch) => {
    const res = getRentalsEndpoint();
    if(res.status === 201) {
      const {data} = res;
      dispatch(setPaperworks(data))
      dispatch(setLoading(false))
      showSuccessMessage("Trámite con éxito")
      return;
    }
    errorProcess(res,dispatch)
  }
}

export const startGetSellings = () => {
  return async (dispatch) => {
    const res = getSellingsEndpoint();
    if(res.status === 201) {
      const {data} = res;
      dispatch(setPaperworks(data))
      dispatch(setLoading(false))
      showSuccessMessage("Trámite con éxito")
      return;
    }
    errorProcess(res,dispatch)
  }
}
