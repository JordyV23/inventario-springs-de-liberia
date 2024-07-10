import {
  SpringSidebar,
  SpringNavbar,
  SpringLoader,
} from "../components/shared";
import { useSelector } from "react-redux";

export const SpringLayout = ({ children }) => {
  const { isLoading } = useSelector((state) => state.global);

  return (
    <>
      {isLoading ? <SpringLoader /> : ""}
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
