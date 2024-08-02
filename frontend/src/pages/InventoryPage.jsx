import React from "react";
import { FormModal, SpringForm } from "../components";
import { faBox } from "@fortawesome/free-solid-svg-icons";
import { clearInventoryForm } from "../store";
import { useActionsInventory } from "../hooks";
import { RegisterAssetForm } from "../components/RegisterAssetForm";
import { AssetsView } from "../components/AssetsView";
import { useSelector } from "react-redux";

export const InventoryPage = () => {
  const { makeCreateAsset, makeUpdateAsset } = useActionsInventory();
  const { authRol } = useSelector((state) => state.global);

  return (
    <>
      {authRol === "C" ? "" : <RegisterAssetForm />}
      <AssetsView />
    </>
  );
};
