import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import axios from "axios";
import React, { useState } from "react";
import { useDispatch, useSelector } from "react-redux";

export const FormInput = ({ type, formProps, textColor }) => {
  switch (type) {
    case "InputFiled":
      return <InputField formProps={formProps} textColor={textColor} />;
    case "SelectField":
      return <SelectFiled formProps={formProps} textColor={textColor} />;
    case "TextArea":
      return <TextArea formProps={formProps} textColor={textColor} />;
    case "ToggleWithChild":
      return <ToggleWithChild formProps={formProps} textColor={textColor} />;
    case "ImageInput":
      return <ImageInput formProps={formProps} textColor={textColor} />;
    default:
      break;
  }
};

const InputField = ({ formProps, textColor }) => {
  const state = useSelector((state) => state[formProps.stateName]);
  const dispatch = useDispatch();
  return (
    <>
      <label
        htmlFor={formProps.id}
        className={"block mb-2 text-sm font-medium " + textColor}
      >
        <FontAwesomeIcon icon={formProps.icon} size="xl" className="mr-1" />
        {formProps.label}
      </label>
      <input
        type={formProps.type}
        name={formProps.id}
        id={formProps.id}
        className="bg-gray-50 border border-gray-300 rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5"
        placeholder={formProps.placeholder}
        onChange={(e) => dispatch(formProps.write(e.target.value))}
        readOnly={formProps.editable}
        value={state[formProps.id]}
        required
        {...formProps.aditional}
      />
    </>
  );
};

const SelectFiled = ({ formProps, textColor }) => {
  const state = useSelector((state) => state[formProps.stateName]);
  const dispatch = useDispatch();
  return (
    <>
      <label
        htmlFor={formProps.id}
        className={"block mb-2 text-sm font-medium " + textColor}
      >
        <FontAwesomeIcon icon={formProps.icon} size="xl" className="mr-1" />
        {formProps.label}
      </label>
      <select
        name={formProps.id}
        id={formProps.id}
        className="bg-gray-50 border border-gray-300 rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5"
        value={state[formProps.id]}
        onChange={(e) => dispatch(formProps.write(e.target.value))}
      >
        <option value="">Seleccione una Opción</option>
        {formProps.fieldOptions.map((option) => (
          <option key={option.value} value={option.value}>
            {option.label}
          </option>
        ))}
      </select>
    </>
  );
};

const TextArea = ({ formProps, textColor }) => {
  const state = useSelector((state) => state[formProps.stateName]);
  const dispatch = useDispatch();
  return (
    <>
      <label
        htmlFor={formProps.id}
        className={"block mb-2 text-sm font-medium " + textColor}
      >
        <FontAwesomeIcon icon={formProps.icon} size="xl" className="mr-1" />
        {formProps.label}
      </label>
      <textarea
        name={formProps.id}
        id={formProps.id}
        className="bg-gray-50 border border-gray-300 rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5"
        placeholder={formProps.placeholder}
        onChange={(e) => dispatch(formProps.write(e.target.value))}
        readOnly={formProps.editable}
        value={state[formProps.id]}
      />
    </>
  );
};

const ToggleWithChild = ({ formProps, textColor }) => {
  const state = useSelector((state) => state[formProps.stateName]);
  const dispatch = useDispatch();

  const handleChange = (e) => {
    dispatch(formProps.write(e.target.checked));
    dispatch(formProps.childProps.write("0"));
  };

  return (
    <>
      <label
        htmlFor={formProps.id}
        className={"block mb-2 text-sm font-medium " + textColor}
      >
        <FontAwesomeIcon icon={formProps.icon} size="xl" className="mr-1" />
        {formProps.label}
      </label>
      <label className="inline-flex items-center cursor-pointer">
        <input
          type="checkbox"
          value={state[formProps.id]}
          className="sr-only peer"
          onChange={(e) => handleChange(e)}
        />
        <div className="relative w-11 h-6 bg-gray-200 peer-focus:outline-none peer-focus:ring-4 peer-focus:ring-blue-300 dark:peer-focus:ring-blue-800 rounded-full peer peer-checked:after:translate-x-full rtl:peer-checked:after:-translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:start-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all  peer-checked:bg-blue-600"></div>
      </label>

      {state[formProps.childDependency] ? (
        <InputField formProps={formProps.childProps} textColor={textColor} />
      ) : (
        ""
      )}
    </>
  );
};

const ImageInput = ({ formProps, textColor }) => {
  const state = useSelector((state) => state[formProps.stateName]);
  const dispatch = useDispatch();

  const [file, setFile] = useState();

  const handleChange = async (e) => {
    setFile(e.target.files[0]);
    // await axios.post("http://localhost:2305/activos/guardarImagen", {
    //   body: formData,
    // });

    // dispatch(formProps.write(e.target.files[0].picture.name));
  };

  const send = () => {
    const formData = new FormData();
    formData.append("image", file);
    fetch("http://localhost:2305/activos/guardarImagen", {
      method: "POST",
      body: formData,
    });
  };

  return (
    <>
      <label
        className={"block mb-2 text-sm font-medium " + textColor}
        htmlFor="file_input"
      >
        Seleccionar Imagen
      </label>
      <input
        className="block w-full text-sm text-gray-900 border border-gray-700 rounded-lg cursor-pointer bg-gray-50 focus:outline-none"
        aria-describedby="file_input_help"
        id="file_input"
        type="file"
        accept="image/png, image/jpeg"
        onChange={(e) => handleChange(e)}
      />
      <button onClick={() => send()}>Enviar</button>
    </>
  );
};
