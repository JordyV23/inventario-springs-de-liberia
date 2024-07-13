import React, { useState } from "react";
import { FormModal } from "./FormModal";
import { faBox, faImage } from "@fortawesome/free-solid-svg-icons";
import { assetRegisterFileds } from "../data";
import { FormInput } from "./FormInput";
import { clearInventoryForm } from "../store";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

export const RegisterAssetForm = () => {
  const [file, setFile] = useState();

  const handleCreate = () => {
    console.log();
  };

  return (
    <>
      <FormModal
        label={"Agregar Activo"}
        icon={faBox}
        creationFunction={handleCreate}
        clearFunction={clearInventoryForm}
      >
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

            <label
              className={"block mb-2 text-sm font-medium text-black"}
              htmlFor="file_input"
            >
              <FontAwesomeIcon icon={faImage} size="xl" className="mr-1" />
              Seleccionar Imagen
            </label>
            <input
              className="block w-full text-sm text-gray-900 border border-gray-700 rounded-lg cursor-pointer bg-gray-50 focus:outline-none"
              aria-describedby="file_input_help"
              id="file_input"
              type="file"
              accept="image/png, image/jpeg"
              onChange={(e) => setFile(e.target.files[0])}
            />
          </div>
        </div>
      </FormModal>
    </>
  );
};
