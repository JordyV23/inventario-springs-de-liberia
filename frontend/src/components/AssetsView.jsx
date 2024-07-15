import React, { useEffect, useState } from "react";
import { useSelector } from "react-redux";
import { AssetCard } from "./AssetCard";
import { useActionsInventory } from "../hooks";

export const AssetsView = () => {
  const { assets } = useSelector((state) => state.inventory);

  const [Assets, setAssets] = useState();

  const { makeGetAsset } = useActionsInventory();

  useEffect(() => {
    makeGetAsset();
  }, []);

  return (
    <>
      <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-3 p-4">
        {assets.map((asset, i) => (
          <AssetCard Asset={asset} key={i} />
        ))}
      </div>
    </>
  );
};
