import { faArrowRight } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import React from "react";
import { Link } from "react-router-dom";

export const PaperworkCard = ({ title, icon, path }) => {
  return (
    <>
      <div className="max-w rounded-md shadow-md bg-gray-50 mt-10  hover:scale-105 duration-500">
        <div className="flex flex-col justify-between p-6 space-y-8">
          <div className=" grid grid-cols-2 ">
            <p className="text-gray-800 pt-1 text-center">
              <FontAwesomeIcon icon={icon} size="10x" className="mr-1" />
            </p>
            <h2 className="text-3xl text-left font-semibold tracking-wide ">
              {title}
            </h2>
          </div>
          <div className="flex space-x-2">
            <Link
              to={path}
              className="flex-1 p-3 font-semibold tracking-wide rounded-md bg-SpringBrown text-white hover:bg-[#ffb762]"
              onClick={() => {}}
            >
              Ver Más
              <FontAwesomeIcon icon={faArrowRight} size="xl" className="ml-1" />
            </Link>
          </div>
        </div>
      </div>
    </>
  );
};
