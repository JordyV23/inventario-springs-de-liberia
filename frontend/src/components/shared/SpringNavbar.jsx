import React from "react";
import { useDispatch } from "react-redux";
import { changeSidebar } from "../../store";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faBars, faRightFromBracket } from "@fortawesome/free-solid-svg-icons";

export const SpringNavbar = () => {
  const dispatch = useDispatch();

  const handleLogout = () => {
    localStorage.removeItem("persist:root");
    window.location.reload();
  };

  return (
    <>
      <>
        <header className="flex items-center justify-between p-4 text-semibold text-gray-100 bg-SpringBlue">
          <div className="flex items-center">
            <button
              className="p-1 mr-4"
              onClick={() => dispatch(changeSidebar())}
            >
              <FontAwesomeIcon icon={faBars} className="h-4 w-4" />
            </button>
            <img src="/images/NavLogo.png" alt="" className="rounded-full" />
          </div>
          <button
            onClick={() => handleLogout()}
            className="flex items-center py-1 px-3 text-gray-100 hover:text-SpringBrown"
          >
            <FontAwesomeIcon icon={faRightFromBracket} className="mr-2" />
            <span className="hidden sm:inline">Cerrar Sesión</span>
          </button>
        </header>
      </>
    </>
  );
};
