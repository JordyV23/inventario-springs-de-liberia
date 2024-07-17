import { DotLottiePlayer } from "@dotlottie/react-player";
import React from "react";

export const NoData = () => {
  return (
    <>
      <div className="container mx-auto px-2 sm:px-4 md:px-6 lg:px-8 bg-white rounded-lg shadow-md">
        <h1 className="text-center font-bold mt-10 font pt-10 text-2xl text-gray-500">
          Uups, parece que no hay datos para mostrar...
        </h1>

        <DotLottiePlayer
          className="mx-auto"
          autoplay
          loop
          src="../../../public/animations/NoData.lottie"
          style={{ height: "300px", width: "300px" }}
        />
      </div>
    </>
  );
};
