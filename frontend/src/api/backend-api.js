import axios from "axios";

const backendApi = {
  personas: axios.create({
    baseURL: `${import.meta.env.VITE_API_URL}personas`,
  })
};


export default backendApi;
