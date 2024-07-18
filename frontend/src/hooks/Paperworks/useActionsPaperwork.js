import { useDispatch, useSelector } from "react-redux";
import {
  setLoading,
  startCreateRental,
  startCreateSelling,
  startDeleteSelling,
  startDeleteRental,
  startGetRentals,
  startGetSellings,
  startEditRental,
} from "../../store";
import moment from "moment-timezone";

export const useActionsPaperwork = () => {
  const dispatch = useDispatch();

  const {
    idPaperwork,
    idRental,
    idAsset,
    idPerson,
    fechaRegistro,
    fechaInicio,
    fechaFin,
    jsonDetalles,
  } = useSelector((state) => state.paperworks);

  const makeCreateRental = () => {
    let fecha = moment.tz("America/Costa_Rica");

    dispatch(setLoading(true));
    dispatch(
      startCreateRental({
        idAsset,
        idPerson,
        fechaRegistroAlquiler: fecha.format("YYYY-MM-DD"),
        fechaInicio,
        fechaFin,
        jsonDetalles,
      })
    );
  };

  const makeCreateSelling = () => {
    let fecha = moment.tz("America/Costa_Rica");

    dispatch(setLoading(true));
    dispatch(
      startCreateSelling({
        idAsset,
        idPerson,
        fecha: fecha.format("YYYY-MM-DD"),
      })
    );
  };

  const makeEditRental = () => {
    let fechaActual = moment.tz("America/Costa_Rica");
    let finAlquiler = moment(fechaFin);
    let estadoFecha = fechaActual.isAfter(finAlquiler) 

    dispatch(setLoading(true));
    dispatch(
      startEditRental({
        id: idRental,
        fechaFin,
        alquilerActivo: estadoFecha ? "0" : "1"
      })
    );
  };

  const makeDeleteSelling = (row) => {
    dispatch(setLoading(true));
    dispatch(startDeleteSelling({ id: row.idSelling }));
  };

  const makeDeleteRental = (row) => {
    dispatch(setLoading(true));
    dispatch(startDeleteRental({ id: row.idRental }));
  };

  const makeGetRentals = () => {
    dispatch(setLoading(true));
    dispatch(startGetRentals());
  };

  const makeGetSellings = () => {
    dispatch(setLoading(true));
    dispatch(startGetSellings());
  };

  return {
    makeCreateRental,
    makeCreateSelling,
    makeDeleteSelling,
    makeDeleteRental,
    makeGetRentals,
    makeGetSellings,
    makeEditRental,
  };
};
