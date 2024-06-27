import React from "react";
import { Logo } from "../components/shared";

export const AuthLayout = ({ children, title }) => {
  return (
    <>
      <section className="animate__animated animate__fadeIn">
        <div className="flex flex-col items-center justify-center px-6 py-8 mx-auto md:h-screen lg:py-0">
          <Logo />
          <div className="w-full bg-SpringBlue rounded-lg shadow md:mt-0 sm:max-w-md xl:p-0">
            <div className="p-6 space-y-4 md:space-y-6 sm:p-8">
              <h1 className="text-xl font-bold leading-tight tracking-tight text-SpringWhite md:text-2xl">
                {title}
              </h1>
              {children}
            </div>
          </div>
        </div>
      </section>
    </>
  );
};
