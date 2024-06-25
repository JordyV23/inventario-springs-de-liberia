import { faUser } from "@fortawesome/free-solid-svg-icons";
import { faKey } from "@fortawesome/free-solid-svg-icons/faKey";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import React from "react";

const Logo = () => (
  <a
    href="#"
    className="flex items-center mb-6 text-2xl font-semibold text-SpringBrown"
  >
    <img
      className="w-8 h-8 mr-2"
      src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/logo.svg"
      alt="logo"
    />
    Springers Real State
  </a>
);

const InputField = ({ id, label, icon, type, placeholder }) => (
  <div>
    <label
      htmlFor={id}
      className="block mb-2 text-sm font-medium text-SpringWhite"
    >
      <FontAwesomeIcon icon={icon} size="xl" className="text-white mr-1" />
      {label}
    </label>
    <input
      type={type}
      name={id}
      id={id}
      className="bg-gray-50 border border-gray-300 rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5"
      placeholder={placeholder}
      required
    />
  </div>
);

const LoginForm = () => (
  <form className="space-y-4 md:space-y-6" action="#">
    <InputField
      id="username"
      label="Nombre de Usuario"
      icon={faUser}
      type="text"
      placeholder="user1234"
    />
    <InputField
      id="password"
      label="Contraseña"
      icon={faKey}
      type="password"
      placeholder="••••••••"
    />
    <div className="flex justify-center">
      <button
        type="submit"
        className="w-auto text-white border hover:bg-SpringBrown hover:border-none focus:ring-4 focus:outline-none focus:ring-SpringBrown font-medium rounded-xl text-sm px-5 py-2.5 text-center"
      >
        Iniciar Sesión
      </button>
    </div>
    <p className="text-sm font-light text-white">
      No tiene una cuenta?
      <a href="#" className="font-medium text-SpringBrown hover:underline ml-1">
        Registrarme
      </a>
    </p>
  </form>
);

export const LoginPage = () => (
  <section className="bg-SpringLight">
    <div className="flex flex-col items-center justify-center px-6 py-8 mx-auto md:h-screen lg:py-0">
      <Logo />
      <div className="w-full bg-SpringBlue rounded-lg shadow md:mt-0 sm:max-w-md xl:p-0">
        <div className="p-6 space-y-4 md:space-y-6 sm:p-8">
          <h1 className="text-xl font-bold leading-tight tracking-tight text-SpringWhite md:text-2xl">
            Inicio de Sesión
          </h1>
          <LoginForm />
        </div>
      </div>
    </div>
  </section>
);
