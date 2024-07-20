import {
  faEdit,
  faEye,
  faHammer,
  faMagnifyingGlass,
  faPenToSquare,
  faTrash,
} from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import React, { useEffect, useState } from "react";
import DataTable from "react-data-table-component";
import { useDispatch } from "react-redux";
import { changeModalState, setEdition, writeModalTitle } from "../store";
import Swal from "sweetalert2";
import { NoData } from "./shared/NoData";

export const SpringDataTable = ({
  data,
  columnTitles,
  editModalTitle,
  editFunction,
  deleteFunction,
  renderEdit = true,
  maintenancePage = false,
  closeMaintenance = () => {},
}) => {
  if (data.length > 0) {
    return (
      <TableComponent
        data={data}
        columnTitles={columnTitles}
        editModalTitle={editModalTitle}
        editFunction={editFunction}
        deleteFunction={deleteFunction}
        maintenancePage={maintenancePage}
        renderEdit={renderEdit}
        closeMaintenance={closeMaintenance}
      />
    );
  } else {
    return <NoData />;
  }
};

const ActionBtn = ({ icon, event, type }) => {
  const btnTypes = {
    E: "text-blue-500 hover:text-blue-700",
    D: "text-red-500 hover:text-red-700",
    I: "text-gray-500",
  };

  return (
    <button
      onClick={() => event()}
      className={`mr-2 p-1 ${btnTypes[type]}`}
      disabled={type === "I"}
    >
      <FontAwesomeIcon size="2x" icon={icon} />
    </button>
  );
};

const TableComponent = ({
  data,
  columnTitles,
  editModalTitle,
  editFunction,
  deleteFunction,
  renderEdit,
  maintenancePage,
  closeMaintenance,
}) => {
  const [records, setRecords] = useState(data);
  const dispatch = useDispatch();

  const columnKeys = Object.keys(data[0]);

  useEffect(() => {
    setRecords(data);
  }, [data]);

  const onEdit = (row) => {
    if (maintenancePage) {
      editFunction(row);
    } else {
      dispatch(editFunction(row));
    }
    dispatch(writeModalTitle(editModalTitle));
    dispatch(setEdition());
    dispatch(changeModalState());
  };

  const onDelete = (row) => {
    Swal.fire({
      title: "¿Seguro de que desea eliminar este registro?",
      text: "Esta acción no podrá ser revertida",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "Eliminar",
      cancelButtonText: "Cancelar",
    }).then((result) => {
      if (result.isConfirmed) {
        deleteFunction(row);
      }
    });
  };

  const columns = [
    ...columnTitles.map((col, i) => ({
      name: col,
      selector: (row) => row[columnKeys[i]],
      sortable: true,
    })),
    {
      name: "Acciones",
      cell: (row) => (
        <div>
          {maintenancePage ? (
            <>
              <ActionBtn
                type={row.pendiente ? "E" : "I"}
                event={() => closeMaintenance(row)}
                icon={faHammer}
              />
              <ActionBtn type={"E"} event={() => onEdit(row)} icon={faEye} />
            </>
          ) : (
            ""
          )}
          {renderEdit ? (
            <ActionBtn type={"E"} event={() => onEdit(row)} icon={faEdit} />
          ) : (
            ""
          )}
          {/* <ActionBtn type={"E"} event={() => onEdit(row)} icon={faEdit} /> */}
          <ActionBtn type={"D"} event={() => onDelete(row)} icon={faTrash} />
        </div>
      ),
      ignoreRowClick: true,
    },
  ];

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
