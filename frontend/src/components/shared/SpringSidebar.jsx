import React from "react";
import { useSelector } from "react-redux";
import { LinkComponent } from "./LinkComponent";
import { springLinks } from "../../data";

export const SpringSidebar = () => {
  const { sidebarOpen } = useSelector((state) => state.global);

  return (
    <>
      <aside
        className={`flex-shrink-0 w-64 flex flex-col transition-all duration-300 ${
          !sidebarOpen ? "-ml-64" : ""
        }`}
      >
        <div className="h-16 bg-SpringBlue"></div>
        <nav className="flex-1 flex flex-col bg-SpringBlue">
          {springLinks.map(({ icon, route, label }) => (
            <LinkComponent
              icon={icon}
              location={route}
              label={label}
              key={route}
            />
          ))}
        </nav>
      </aside>
    </>
  );
};
