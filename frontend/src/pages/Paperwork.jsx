import React from "react";
import { PaperworkCard } from "../components/PaperworkCard";
import { faHouse, faSackDollar } from "@fortawesome/free-solid-svg-icons";

export const Paperwork = () => {
  return (
    <>
      <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-2 gap-3 p-4">
        <PaperworkCard
          path={"/tramites/ventas"}
          icon={faHouse}
          title={"Alquileres"}
        />
        <PaperworkCard
          path={"/tramites/alquileres"}
          icon={faSackDollar}
          title={"Ventas"}
        />
      </div>
    </>
  );
};
