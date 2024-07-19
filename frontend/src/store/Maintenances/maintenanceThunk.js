import { useApiMaintenance } from "../../hooks";
import { errorProcess, showSuccessMessage } from "../../utils/messages";
import { changeModalState, setLoading } from "../Global";
import { setAssets } from "../Inventory";
import { setMantenimientos } from "./maintenanceSlice";

const {
  createMaintenanceEndpoint,
  closeMaintenanceEndpoint,
  deleteMaintenanceEndpoint,
  getMaintenanceEndpoint,
} = useApiMaintenance();

export const startCreateMaintenance = (maintenance) => {
  return async (dispatch) => {
    const res = await createMaintenanceEndpoint(maintenance);
    if (res.status === 201) {
      const { data } = res;
      dispatch(setMantenimientos(data.data));
      showSuccessMessage("Mantenimiento creado exitosamente");
      dispatch(changeModalState());
      dispatch(setLoading(false));
      return;
    }
    errorProcess(res, dispatch);
  };
};
export const startCloseMaintenance = (maintenance) => {
  return async (dispatch) => {
    const res = await closeMaintenanceEndpoint(maintenance);
    if (res.status === 201) {
      const { data } = res;
      dispatch(setMantenimientos(data.data));
      showSuccessMessage("Mantenimiento cerrado exitosamente");
      dispatch(changeModalState());
      dispatch(setLoading(false));
      return;
    }
    errorProcess(res, dispatch);
  };
};
export const startDeleteMaintenance = (maintenance) => {
  return async (dispatch) => {
    const res = await deleteMaintenanceEndpoint(maintenance);
    if (res.status === 201) {
      const { data } = res;
      dispatch(setMantenimientos(data.data));
      showSuccessMessage("Mantenimiento eliminado exitosamente");
      dispatch(setLoading(false));
      return;
    }
    errorProcess(res, dispatch);
  };
};
export const startGetMaintenances = (maintenance) => {
  return async (dispatch) => {
    const res = await getMaintenanceEndpoint(maintenance);
    if (res.status === 201) {
      const { data } = res;
      dispatch(setMantenimientos(data.data));
      dispatch(setLoading(false));
      return;
    }
    errorProcess(res, dispatch);
  };
};
