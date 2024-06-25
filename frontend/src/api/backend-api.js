import axios from "axios";

const backendApi = axios.create({
  baseURL: import.meta.env.VITE_API_URL,
});

export default backendApi;
