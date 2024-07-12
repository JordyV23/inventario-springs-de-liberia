import { useApiInventory } from "../../hooks/Inventories/useApiInventory";
import { errorProcess, showSuccessMessage } from "../../utils/messages";
import { setLoading } from "../Global";
import { setAssets } from "./inventorySlice";

const { createAsset, updateAsset, deleteAsset, getAsset } = useApiInventory();

export const startCreateAsset = (asset) => {
  return async (dispatch) => {
    const res = await createAsset(asset);
    if (res.status === 201) {
      const { data } = res;
      dispatch(setAssets(data.data));
      showSuccessMessage("Activo creado exitosamente");
      dispatch(setLoading(false));
      return;
    }
    errorProcess(res, dispatch);
  };
};

export const startUpdateAsset = (asset) => {
  return async (dispatch) => {
    const res = await updateAsset(asset);
    if (res.status === 201) {
      const { data } = res;
      dispatch(setAssets(data.data));
      showSuccessMessage("Activo editado exitosamente");
      dispatch(setLoading(false));
      return;
    }
    errorProcess(res, dispatch);
  };
};

export const startDeleteAsset = (asset) => {
  return async (dispatch) => {
    const res = await deleteAsset(asset);
    if (res.status === 201) {
      const { data } = res;
      dispatch(setAssets(data.data));
      showSuccessMessage("Activo eliminado exitosamente");
      dispatch(setLoading(false));
      return;
    }
    errorProcess(res, dispatch);
  };
};

export const startGetAsset = () => {
  return async (dispatch) => {
    const res = await getAsset();
    if (res.status === 201) {
      const { data } = res;
      dispatch(setAssets(data.data));
      dispatch(setLoading(false));
      return;
    }
    errorProcess(res, dispatch);
  };
};
