import { useDispatch, useSelector } from "react-redux";
import {
  setLoading,
  startCreateAsset,
  startDeleteAsset,
  startGetAsset,
  startUpdateAsset,
} from "../../store";

export const useActionsInventory = () => {
  const dispatch = useDispatch();

  const {
    idActivo,
    titulo,
    tipoActivo,
    descripcion,
    disponibilidad,
    electrodomesticos,
    idCanton,
    distrito,
    idProvincia,
    numeroHabitaciones,
    precioGlobal,
    precioPorMes,
    precioPorNoche,
    imagen,
    direccion,
  } = useSelector((state) => state.inventory);

  const makeCreateAsset = () => {
    dispatch(setLoading(true));
    dispatch(
      startCreateAsset({
        nombre: titulo,
        descripcion,
        idProvincia: idProvincia.value,
        idCanton: idCanton.value,
        distrito: distrito.value,
        detalleDireccion: direccion,
        precioGlobal:"0",
        tipoAsset: tipoActivo,
        precioPorNoche,
        precioPorMes,
        disponibilidad,
        imagenSrc: imagen,
      })
    );
  };

  const makeUpdateAsset = () => {
    dispatch(setLoading(true));
    dispatch(
      startUpdateAsset({
        id: idActivo,
        nombre: titulo,
        descripcion,
        idProvincia,
        idCanton,
        distrito,
        detalleDireccion,
        precioGlobal,
        tipoAsset: tipoActivo,
        precioPorNoche,
        precioPorMes,
        disponibilidad,
        imagenSrc: imagen,
      })
    );
  };

  const makeDeleteAsset = () => {
    dispatch(setLoading(true));
    dispatch(startDeleteAsset({ id: idActivo }));
  };

  const makeGetAsset = () => {
    dispatch(setLoading(true));
    dispatch(startGetAsset());
  };

  return {
    makeCreateAsset,
    makeUpdateAsset,
    makeDeleteAsset,
    makeGetAsset,
  };
};
