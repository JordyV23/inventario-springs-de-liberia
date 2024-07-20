import React from "react";
import { useDispatch } from "react-redux";
import { changeSidebar } from "../../store";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faBars } from "@fortawesome/free-solid-svg-icons";

export const SpringNavbar = () => {
  const dispatch = useDispatch();
  return (
    <>
      <header className="flex items-center p-4 text-semibold text-gray-100 bg-SpringBlue">
        <button className="p-1 mr-4" onClick={() => dispatch(changeSidebar())}>
        <FontAwesomeIcon icon={faBars} className="h-4 w-4" />
        </button>
        <img src="/images/NavLogo.png" alt="" className="rounded-full" />
      </header>
    </>
  );
};
