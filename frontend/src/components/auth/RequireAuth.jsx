import { Navigate } from "react-router-dom";

/**
 * Componente de alto orden que verifica si el usuario está autenticado.
 * Si el usuario no está autenticado, redirige a la página de inicio de sesión.
 * @param {Object} props - Propiedades del componente.
 * @param {boolean} props.isLogged - Indica si el usuario está autenticado.
 * @param {ReactNode} props.children - Los elementos secundarios que deben ser renderizados si el usuario está autenticado.
 * @returns {ReactNode} Los elementos secundarios renderizados si el usuario está autenticado; de lo contrario, redirige a la página de inicio de sesión.
 */
export const RequireAuth = ({ isLogged, children }) => {

  if (!isLogged ) {
    return <Navigate to="login" />;
  }

  return children;
};
