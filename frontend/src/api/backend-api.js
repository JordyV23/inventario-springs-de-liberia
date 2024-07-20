import axios from "axios";

const backendApi = {
  personas: axios.create({
    baseURL: `${import.meta.env.VITE_API_URL}personas`,
  }),
  promociones: axios.create({
    baseURL: `${import.meta.env.VITE_API_URL}publicidad`,
  }),
  activos: axios.create({
    baseURL: `${import.meta.env.VITE_API_URL}activos`,
  }),
  tramites: axios.create({
    baseURL: `${import.meta.env.VITE_API_URL}tramites`,
  }),
  mantenimientos: axios.create({
    baseURL: `${import.meta.env.VITE_API_URL}mantenimientos`,
  }),
  reportes: axios.create({
    baseURL: `${import.meta.env.VITE_API_URL}reportes`,
  }),
};


export default backendApi;
