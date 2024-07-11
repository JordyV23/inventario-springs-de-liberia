import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import React from "react";
import { useDispatch, useSelector } from "react-redux";

export const FormInput = ({ type, formProps, textColor }) => {
  switch (type) {
    case "InputFiled":
      return <InputField formProps={formProps} textColor={textColor} />;
    case "SelectField":
      return <SelectFiled formProps={formProps} textColor={textColor} />;
    case "TextArea":
      return <TextArea formProps={formProps} textColor={textColor} />;
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
        <option value="">Seleccione un</option>
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