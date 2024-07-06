import {
  faMagnifyingGlass,
  faPenToSquare,
} from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Button } from "flowbite-react";
import React, { useState } from "react";
import DataTable from "react-data-table-component";

export const SpringDataTable = ({ data, columnTitles }) => {
  if (data.length > 0) {
    return <TableComponent data={data} columnTitles={columnTitles} />;
  } else {
    return (
      <div className="container mx-auto px-2 sm:px-4 md:px-6 lg:px-8">
        <h1 className="text-center font-bold mt-10 font" >No hay datos para mostrar</h1>
      </div>
    );
  }
};

const TableComponent = ({ data, columnTitles }) => {
  const [records, setRecords] = useState(data);

  const columnKeys = Object.keys(data[0]);

  const columns = columnTitles.map((col, i) => ({
    name: col,
    selector: (row) => row[columnKeys[i]],
    sortable: true,
  }));

  const handleFilter = (event) => {
    const searchValue = event.target.value.toLowerCase();
    const newData = data.filter((row) => {
      return columnKeys.some((field) =>
        String(row[field]).toLowerCase().includes(searchValue)
      );
    });
    setRecords(newData);
  };

  const customStyles = {
    table: {
      style: {
        borderRadius: "0.5rem",
        overflow: "hidden",
      },
    },
    headCells: {
      style: {
        fontWeight: "bold",
        fontSize: "1rem",
      },
    },
    rows: {
      style: {
        minHeight: "60px",
      },
    },
  };

  return (
    <>
      <div className="container mx-auto px-2 sm:px-4 md:px-6 lg:px-8">
        <form className="form relative mb-4">
          <button className="absolute left-2 top-1/2 transform -translate-y-1/2 p-1">
            <FontAwesomeIcon
              icon={faMagnifyingGlass}
              className="text-gray-400 text-sm sm:text-base"
            />
          </button>
          <input
            className="w-full input rounded-full px-8 sm:px-10 py-2 sm:py-3 text-sm sm:text-base border-2 border-transparent focus:outline-none focus:border-blue-500 placeholder-gray-400 transition-all duration-300 shadow-md"
            placeholder="Búsqueda..."
            onChange={handleFilter}
            type="text"
          />
        </form>

        <div className="rounded-lg overflow-hidden shadow-lg">
          <div className="overflow-x-auto">
            <DataTable
              data={records}
              columns={columns}
              customStyles={customStyles}
              fixedHeader
              pagination
              responsive
              className="mt-4 w-full"
            />
          </div>
        </div>
      </div>
    </>
  );
};
