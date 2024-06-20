import app from "./app.js";
import 'dotenv/config'
let port = process.env.PORT;

app.listen(port);

console.log(
  `El servidor esta corriendo en el puerto http://localhost:${port}`
);
console.log(`Last Update: ${new Date()}`);
