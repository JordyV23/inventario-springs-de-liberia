import "animate.css";
import React, { useEffect } from "react";
import { Link, useNavigate } from "react-router-dom";
import { AuthLayout } from "../../layouts/AuthLayout";
import { FormInput } from "../../components/FormInput";
import { loginFields } from "../../data/userFormFields";
const { usernameInput, passwordInput } = loginFields();
import { useActionsUsers } from "../../hooks/Users/useActionsUsers";
import { useSelector } from "react-redux";

export const LoginPage = () => {
  const { token } = useSelector((state) => state.global);

  const navigate = useNavigate();

  const { makeLogin } = useActionsUsers();

  const loginAction = async (event) => {
    event.preventDefault();
    makeLogin();
  };

  useEffect(() => {
    if (token) {
      navigate("/users", { replace: true });
    }
  }, [token]);

  return (
    <>
      <AuthLayout title={"Inicio de Sesión"}>
        <LoginForm submitEvent={loginAction} />
      </AuthLayout>
    </>
  );
};

const LoginForm = ({ submitEvent }) => (
  <form className="space-y-4 md:space-y-6" onSubmit={submitEvent}>
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
