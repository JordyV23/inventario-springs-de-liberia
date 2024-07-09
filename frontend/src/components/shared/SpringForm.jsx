import React from "react";
import { FormInput } from "../FormInput";

export const SpringForm = ({ submitEvent = () => {}, fields }) => {
  return (
    <form className="space-y-4 md:space-y-6" onSubmit={submitEvent}>
      <div className="grid grid-cols-1 md:grid-cols-[auto,1fr] md:gap-4 gap-1 items-center">
        {fields.map((field, i) => (
          <FormInput
            key={i}
            type={"InputFiled"}
            formProps={field}
            textColor={"text-black"}
          />
        ))}
      </div>
    </form>
  );
};
