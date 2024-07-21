import { faMagnifyingGlassChart } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import React from "react";
import { changeModalState } from "../store";
import { useDispatch } from "react-redux";

export const ReportCard = ({ reportData }) => {
  const dispatch = useDispatch();

  const handleClick = () => {
    dispatch(changeModalState());
    dispatch(reportData.function());
  };

  return (
    <>
      <div className=" p-6 bg-white border border-gray-200 rounded-lg shadow ">
        <FontAwesomeIcon
          icon={reportData.icon}
          className=" w-7 h-7 text-gray-500 mb-3 "
        />
        <h5 className="mb-2 text-2xl font-semibold tracking-tight text-gray-900">
          {/* Need a help in Claim? */}
          {reportData.label}
        </h5>
        <p className="mb-3 font-normal text-gray-500">
          {/* Go to this step by step guideline process on how to certify for your
          weekly benefits: */}
          {reportData.description}
        </p>
        <button
          onClick={() => handleClick()}
          className="inline-flex font-medium items-center bg-blue-600 text-white p-2 rounded-full hover:scale-110 duration-500"
        >
          Generar Reporte
          <FontAwesomeIcon
            icon={faMagnifyingGlassChart}
            className=" w-6 h-6 ms-2.5 "
          />
        </button>
      </div>
    </>
  );
};
