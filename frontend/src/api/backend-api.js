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
};


export default backendApi;
