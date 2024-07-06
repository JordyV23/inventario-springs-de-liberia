import { useState } from "react";
import { SpringSidebar, SpringNavbar } from "../components/shared";
import { Navbar, Sidebar } from "flowbite-react";
import { useDispatch, useSelector } from "react-redux";
import { changeSidebar } from "../store";

export const SpringLayout = ({ children }) => {
  const { sidebarOpen } = useSelector((state) => state.global);

  return (
    <>
      <div className="flex overflow-x-hidden h-screen">
        <SpringSidebar />
        <div className="flex flex-col flex-grow overflow-hidden">
          <SpringNavbar />
          <main className="flex-grow p-2 sm:p-4 overflow-x-auto overflow-y-auto">
            {children}
          </main>
        </div>
      </div>
    </>
  );
};
