import { faCancel, faCheck } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import React from "react";
import { SpringBtn } from "./shared";

export const ModalFooterOption = ({ type, event }) => {
  return (
    <div className="flex flex-wrap gap-2">
      <BtnComponent event={event} type={type} />
    </div>
  );
};

const BtnComponent = ({ type, event }) => {
  if (type === "accept") {
    return (
      <SpringBtn
        color={"bg-SpringGreen"}
        event={event}
        icon={faCheck}
        label={"Aceptar"}
      />
    );
  }

  if (type === "cancel") {
    return (
      <SpringBtn
        color={"bg-SpringRed"}
        event={event}
        icon={faCancel}
        label={"Cancelar"}
      />
    );
  }
};
