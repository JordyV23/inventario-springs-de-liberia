import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import React from "react";

export const SpringBtn = ({event, icon, label, color}) => {
  return (
    <>
      <button
        className={color + " text-white rounded-lg p-2"}
        onClick={() => event()}
      >
        <FontAwesomeIcon className="mr-2 h-5 w-5" icon={icon} />
        {label}
      </button>
    </>
  );
};
