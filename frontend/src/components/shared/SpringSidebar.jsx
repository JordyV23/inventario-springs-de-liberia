import React from "react";
import { useSelector } from "react-redux";

export const SpringSidebar = () => {
  const { sidebarOpen } = useSelector((state) => state.global);

  return (
    <>
      <aside
        className={`flex-shrink-0 w-64 flex flex-col border-r transition-all duration-300 ${
          !sidebarOpen ? "-ml-64" : ""
        }`}
      >
        <div className="h-16 bg-SpringBlue"></div>
        <nav className="flex-1 flex flex-col bg-white">
          <a href="#" className="p-2">
            Nav Link 1
          </a>
          <a href="#" className="p-2">
            Nav Link 2
          </a>
          <a href="#" className="p-2">
            Nav Link 3
          </a>
        </nav>
      </aside>
    </>
  );
};
