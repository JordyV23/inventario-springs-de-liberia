import React from "react";
import { AuthLayout } from "../../layouts/AuthLayout";
import { FormInput } from "../../components/FormInput";
import { registerFields } from "../../data/userFormFields";
import { Link } from "react-router-dom";

export const RegisterPage = () => {
  return (
    <>
      <AuthLayout title={"Registro de Nuevo Usuario"}>
        <RegisterForm />
      </AuthLayout>
    </>
  );
};

const RegisterForm = () => (
  <form className="space-y-4 md:space-y-6" action="#">
    <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
      {registerFields.map((field, i) => (
        <FormInput key={i} type={"InputFiled"} formProps={field} />
      ))}
    </div>

    {/* <FormInput type={"InputFiled"} formProps={usernameInput} />
    <FormInput type={"InputFiled"} formProps={passwordInput} /> */}

    <div className="flex justify-center">
      <button
        type="submit"
        className="w-auto text-white bg-SpringBrown hover:border-none focus:ring-4 focus:outline-none focus:ring-SpringBrown font-thin rounded-xl text-sm px-5 py-2.5 text-center hover:scale-125 duration-500"
      >
        Registrarme
      </button>
    </div>
    <p className="text-sm font-light text-white">
      Ya tiene una cuenta?
      <Link
        to="/login"
        className="font-medium text-SpringBrown hover:underline ml-1"
      >
        Iniciar Sesión
      </Link>
    </p>
  </form>
);
