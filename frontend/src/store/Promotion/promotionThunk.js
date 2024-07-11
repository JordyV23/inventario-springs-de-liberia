import { useApiPromotion } from "../../hooks";
import { errorProcess, showSuccessMessage } from "../../utils/messages";
import { changeModalState, setLoading } from "../Global";
import { setPromotions } from "./promotionSlice";

const {
  createPromotionEndpoint,
  updatePromotionEndpoint,
  deletePromotionEndpoint,
  getPromotionEndpoint,
} = useApiPromotion();

export const startCreatePromotion = (promotion) => {
  return async (dispatch) => {
    const res = await createPromotionEndpoint(promotion);
    if (res.status === 201) {
      const { data } = res;
      dispatch(setPromotions(data.data))
      showSuccessMessage(
        "Promoción creada exitosamente"
      );
      dispatch(changeModalState());
      dispatch(setLoading(false));
      return;
    }
    errorProcess(res,dispatch)
  };
};

export const startUpdatePromotion = (promotion) => {
  return async (dispatch) => {
    const res = await updatePromotionEndpoint(promotion);
    if (res.status === 201) {
      showSuccessMessage(
        "Promoción editada exitosamente"
      );
      const { data } = res;
      dispatch(setPromotions(data.data))
      dispatch(changeModalState());
      dispatch(setLoading(false));
      return;
    }
    errorProcess(res,dispatch)
  };
};

export const startDeletePromotion = (promotion) => {
  return async (dispatch) => {
    const res = await deletePromotionEndpoint(promotion);
    if (res.status === 201) {
      showSuccessMessage(
        "Promoción eliminada exitosamente"
      );
      const { data } = res;
      dispatch(setPromotions(data.data))
      dispatch(setLoading(false));
      return;
    }
    errorProcess(res,dispatch)
  };
};

export const startGetPromotion = () => {
  return async (dispatch) => {
    const res = await getPromotionEndpoint();
    if (res.status === 201) {
      const { data } = res;
      dispatch(setPromotions(data.data))
      dispatch(setLoading(false));
      return;
    }
    errorProcess(res,dispatch)
  };
};
