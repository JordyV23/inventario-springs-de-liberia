import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import React from "react";
import { Link } from "react-router-dom";

export const LinkComponent = ({ location, icon, label }) => {
  return (
    <>
      <Link
        to={location}
        className="py-1 px-3 text-white hover:text-SpringBrown hover:scale-105 duration-500"
      >
        <FontAwesomeIcon icon={icon} className="mr-2" />
        <span className="font-medium">{label}</span>
      </Link>
    </>
  );
};
