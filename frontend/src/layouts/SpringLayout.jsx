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
        <div className="flex-1">
          <SpringNavbar />
          <main className="p-4">{children}</main>
        </div>
      </div>
    </>
  );
};
