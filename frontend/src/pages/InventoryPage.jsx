import React from "react";
import { FormModal, SpringForm } from "../components";
import { faBox } from "@fortawesome/free-solid-svg-icons";
import { clearInventoryForm } from "../store";
import { useActionsInventory } from "../hooks";
import { RegisterAssetForm } from "../components/RegisterAssetForm";


export const InventoryPage = () => {
  const { makeCreateAsset, makeUpdateAsset } = useActionsInventory();

  return (
    <>
      <RegisterAssetForm/>
    </>
  );
};
