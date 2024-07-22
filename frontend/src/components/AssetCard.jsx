import React, { useEffect, useState } from "react";
import {
  assetRegisterFileds,
  availabilityTypes,
  getAssetAvailability,
  getAssetType,
  getCanton,
  getDistrito,
  getProvincia,
  priceFields,
} from "../data";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faCommentsDollar,
  faEdit,
  faEye,
  faSignsPost,
} from "@fortawesome/free-solid-svg-icons";
import Swal from "sweetalert2";
import { useDispatch, useSelector } from "react-redux";
import { FormInput } from "./FormInput";
import { Modal } from "flowbite-react";
import { ModalFooterOption } from "./ModalFooterOption";
import {
  changeModalState,
  changeQueryState,
  loadInventoryForm,
} from "../store";
import { useActionsInventory } from "../hooks";

export const AssetCard = ({ Asset }) => {
  const [isEditModalOpen, setIsEditModalOpen] = useState(false);
  const { authRol } = useSelector((state) => state.global);

  const { makeDeleteAsset } = useActionsInventory();

  const dispatch = useDispatch();

  const onDelete = () => {
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
        makeDeleteAsset(Asset);
      }
    });
  };
  const handleEdit = () => {
    setIsEditModalOpen(true);
    let newAsset = { ...Asset };
    newAsset.TipoActivo = getAssetType(Asset.TipoActivo).value;
    newAsset.idCanton = getCanton(Asset.idCanton);
    newAsset.distrito = getDistrito(Asset.distrito);
    newAsset.idProvincia = getProvincia(Asset.idProvincia);
    newAsset.disponibilidad = getAssetAvailability(Asset.Disponibilidad).value;
    dispatch(loadInventoryForm(newAsset));
  };

  const handleViewMore = () => {
    Swal.fire({
      title: Asset.nombre,
      html: `
        <div class="text-left">
          <p><strong>Descripción:</strong> ${Asset.descripcion}</p>
          <p><strong>Dirección:</strong> ${Asset.Direccion}</p>
          <p><strong>Estado:</strong> ${Asset.Estado}</p>
          <p><strong>Tipo de Activo:</strong> ${Asset.TipoActivo}</p>
          <p><strong>Disponibilidad:</strong> ${Asset.Disponibilidad}</p>
          ${
            Asset.precioGlobal
              ? `<p><strong>Precio Global:</strong> ₡${Asset.precioGlobal.toLocaleString()}</p>`
              : ""
          }
          ${
            Asset.precioPorMes
              ? `<p><strong>Precio por Mes:</strong> ₡${Asset.precioPorMes.toLocaleString()}</p>`
              : ""
          }
          ${
            Asset.precioPorNoche
              ? `<p><strong>Precio por Noche:</strong> ₡${Asset.precioPorNoche.toLocaleString()}</p>`
              : ""
          }
        </div>
      `,
      imageUrl: `${import.meta.env.VITE_API_URL}${Asset.imagenSrc}`,
      imageWidth: 400,
      imageHeight: 200,
      imageAlt: Asset.nombre,
      confirmButtonText: "Cerrar",
      confirmButtonColor: "#ffb762",
      customClass: {
        container: "font-sans",
      },
    });
  };
  return (
    <>
      <div className="max-w rounded-md shadow-md bg-gray-50">
        <img
          src={`${import.meta.env.VITE_API_URL}${Asset.imagenSrc}`}
          alt="assetImage"
          className="object-cover object-center w-full rounded-t-md h-72 bg-gray-500"
        />
        <div className="flex flex-col justify-between p-6 space-y-8">
          <div className="space-y-2">
            <h2 className="text-3xl font-semibold tracking-wide">
              {Asset.nombre}
            </h2>
            <p className="text-gray-800">{Asset.descripcion}</p>
            <p className="text-gray-800 pt-1">
              <FontAwesomeIcon
                icon={faCommentsDollar}
                size="xl"
                className="mr-1"
              />
              {`Disponible para `}
              <span className="font-bold">{Asset.Disponibilidad}</span>
            </p>
            <p className="text-gray-800 pt-1">
              <FontAwesomeIcon icon={faSignsPost} size="xl" className="mr-1" />
              {`Ubicada en ${Asset.Direccion}`}
            </p>
          </div>
          <div className="flex space-x-2">
            <button
              type="button"
              className="flex-1 p-3 font-semibold tracking-wide rounded-md bg-SpringBrown text-white hover:bg-[#ffb762]"
              onClick={() => handleViewMore()}
            >
              <FontAwesomeIcon icon={faEye} size="xl" className="mr-1" />
              Ver Más
            </button>
            {authRol === "C" ? (
              ""
            ) : (
              <>
                <button
                  type="button"
                  className="flex-1 p-3 font-semibold tracking-wide rounded-md bg-blue-500 text-white hover:bg-blue-600"
                  onClick={() => handleEdit()}
                >
                  <FontAwesomeIcon icon={faEdit} size="xl" className="mr-1" />
                  Editar
                </button>
                <button
                  type="button"
                  className="flex-1 p-3 font-semibold tracking-wide rounded-md bg-SpringRed text-white hover:bg-[#ac1f28]"
                  onClick={() => onDelete()}
                >
                  <FontAwesomeIcon icon={faEdit} size="xl" className="mr-1" />
                  Borrar
                </button>
              </>
            )}
          </div>
        </div>
      </div>

      {isEditModalOpen && (
        <EditionModal
          isEditModalOpen={isEditModalOpen}
          setIsEditModalOpen={setIsEditModalOpen}
        />
      )}
    </>
  );
};

const EditionModal = ({ isEditModalOpen, setIsEditModalOpen }) => {
  const { disponibilidad, querySucces } = useSelector(
    (state) => state.inventory
  );
  const dispatch = useDispatch();

  const { makeUpdateAsset } = useActionsInventory();

  const handleSubmit = () => {
    makeUpdateAsset();
  };

  const handleCloseEditModal = () => {
    setIsEditModalOpen(false);
  };

  useEffect(() => {
    if (querySucces) {
      setIsEditModalOpen(false);
    }
    dispatch(changeQueryState(false));
  }, [querySucces]);

  return (
    <>
      <Modal
        dismissible
        show={isEditModalOpen}
        onClose={() => handleCloseEditModal()}
      >
        <Modal.Header className="bg-SpringBlue">Editar Activo</Modal.Header>
        <Modal.Body className="bg-white border-none">
          <div className="space-y-4 md:space-y-6">
            <div className="grid grid-cols-1 md:grid-cols-[auto,1fr] md:gap-4 gap-1 items-center">
              {assetRegisterFileds.map((field, i) => (
                <FormInput
                  key={i}
                  type={field.fieldType}
                  formProps={field}
                  textColor={"text-black"}
                />
              ))}

              {disponibilidad === availabilityTypes[1] ? (
                <>
                  <FormInput
                    key={priceFields[0].id}
                    type={priceFields[0].fieldType}
                    formProps={priceFields[0]}
                    textColor={"text-black"}
                  />
                  <FormInput
                    key={priceFields[1].id}
                    type={priceFields[1].fieldType}
                    formProps={priceFields[1]}
                    textColor={"text-black"}
                  />
                </>
              ) : (
                ""
              )}
            </div>
          </div>
        </Modal.Body>
        <Modal.Footer className="bg-white border-none">
          <ModalFooterOption type={"accept"} event={handleSubmit} />
          <ModalFooterOption type={"cancel"} event={handleCloseEditModal} />
        </Modal.Footer>
      </Modal>
    </>
  );
};
