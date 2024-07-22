import React from "react";
import { useSelector } from "react-redux";
import { LinkComponent } from "./LinkComponent";
import { springLinks } from "../../data";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faRightFromBracket } from "@fortawesome/free-solid-svg-icons";

export const SpringSidebar = () => {
  const { sidebarOpen, authRol } = useSelector((state) => state.global);

  const handleLogout = () => {
    localStorage.removeItem("persist:root");
    window.location.reload();
  };

  return (
    <>
      <aside
        className={`flex-shrink-0 w-64 flex flex-col transition-all duration-300 ${
          !sidebarOpen ? "-ml-64" : ""
        }`}
      >
        <div className="h-16 bg-SpringBlue"></div>
        <nav className="flex-1 flex flex-col bg-SpringBlue justify-between">
          <div>
            {springLinks.map(({ icon, route, label, allowed }) => {
              if (allowed.includes(authRol)) {
                return (
                  <LinkComponent
                    icon={icon}
                    location={route}
                    label={label}
                    key={route}
                  />
                );
              }
            })}
          </div>
          <button
            onClick={() => handleLogout()}
            className="flex items-center py-1 px-3 text-gray-100 hover:text-SpringBrown mb-4"
          >
            {/* <FiLogOut className="mr-2" /> */}
            <FontAwesomeIcon icon={faRightFromBracket} className="mr-2" />
            Cerrar Sesión
          </button>
        </nav>
      </aside>
    </>
  );
};
