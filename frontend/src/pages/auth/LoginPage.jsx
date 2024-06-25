import "animate.css";
import React from "react";
import { Link } from "react-router-dom";
import { AuthLayout } from "../../layouts/AuthLayout";
import { FormInput } from "../../components/FormInput";
import { loginFields } from "../../data/userFormFields";
const { usernameInput, passwordInput } = loginFields();

export const LoginPage = () => (
  <>
    <AuthLayout title={"Inicio de Sesión"}>
      <LoginForm />
    </AuthLayout>
  </>
);

const LoginForm = () => (
  <form className="space-y-4 md:space-y-6" action="#">
    <FormInput type={"InputFiled"} formProps={usernameInput} />
    <FormInput type={"InputFiled"} formProps={passwordInput} />
    <div className="flex justify-center">
      <button
        type="submit"
        className="w-auto text-white bg-SpringBrown hover:border-none focus:ring-4 focus:outline-none focus:ring-SpringBrown font-thin rounded-xl text-sm px-5 py-2.5 text-center hover:scale-125 duration-500"
      >
        Iniciar Sesión
      </button>
    </div>
    <p className="text-sm font-light text-white">
      No tiene una cuenta?
      <Link
        to="/register"
        className="font-medium text-SpringBrown hover:underline ml-1"
      >
        Registrarme
      </Link>
    </p>
  </form>
);
