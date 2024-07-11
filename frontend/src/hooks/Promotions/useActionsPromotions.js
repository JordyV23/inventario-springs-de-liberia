import { useDispatch, useSelector } from "react-redux";
import {
  setLoading,
  startCreatePromotion,
  startDeletePromotion,
  startGetPromotion,
  startUpdatePromotion,
} from "../../store";

export const useActionsPromotions = () => {
  const dispatch = useDispatch();

  const {
    idPromo,
    titulo,
    fechaInicio,
    fechaFin,
    activa,
    descripcion,
    intervaloDias,
    isPeriodica,
  } = useSelector((state) => state.promotions);

  const makeCreatePromotion = () => {
    dispatch(setLoading(true));
    dispatch(
      startCreatePromotion({
        titulo,
        description: descripcion,
        fechaInicio,
        fechaFin,
        isPeriodica,
        intervalo: intervaloDias,
      })
    );
  };
  const makeUpdatePromotion = () => {
    dispatch(setLoading(true));
    dispatch(
      startUpdatePromotion({
        id: idPromo,
        titulo,
        description:descripcion,
        fechaInicio,
        fechaFin,
        isPeriodica,
        intervalo: intervaloDias,
        activa: activa === "Activo" ? 1 : 0
      })
    );
  };
  const makeDeletePromotion = () => {
    dispatch(setLoading(true));
    dispatch(startDeletePromotion({ id: idPromo }));
  };
  const makeGetPromotions = () => {
    dispatch(setLoading(true));
    dispatch(startGetPromotion());
  };

  return {
    makeCreatePromotion,
    makeUpdatePromotion,
    makeDeletePromotion,
    makeGetPromotions,
  };
};
