import { useDispatch, useSelector } from "react-redux";
import {
  setLoading,
  startCreateMaintenance,
  startCloseMaintenance,
  startDeleteMaintenance,
  startGetMaintenances,
} from "../../store";
import moment from "moment-timezone";

export const useActionsMaintenance = () => {
  const dispatch = useDispatch();

  const {
    idMaintenance,
    idAsset,
    idPerson,
    fechaMantenimiento,
    detalle,
    idOperario,
    motivo,
    detalleCierre,
    costo,
    fechaCierre,
  } = useSelector((state) => state.maintenances);

  const { authUserId } = useSelector((state) => state.global);

  const makeCreateMaintenance = () => {
    let fecha = moment.tz("America/Costa_Rica");

    dispatch(setLoading(true));
    dispatch(
      startCreateMaintenance({
        idAsset,
        idPerson: authUserId,
        fecha: fecha.format("YYYY-MM-DD"),
        detalle,
      })
    );
  };

  const makeCloseMaintenance = () => {
    let fecha = moment.tz("America/Costa_Rica");

    dispatch(setLoading(true));
    dispatch(
      startCloseMaintenance({
        idMaintenance,
        idOperario: authUserId,
        motivo,
        detalle: detalleCierre,
        costo: parseInt(costo),
        fechaCierre: fecha.format("YYYY-MM-DD"),
      })
    );
  };

  const makeDeleteMaintenance = (id) => {
    dispatch(setLoading(true));
    dispatch(startDeleteMaintenance({ id }));
  };

  const makeGetMaintenances = () => {
    dispatch(setLoading(true));
    dispatch(startGetMaintenances());
  };

  return {
    makeCreateMaintenance,
    makeCloseMaintenance,
    makeDeleteMaintenance,
    makeGetMaintenances,
  };
};
