import multer from "multer";
import path from "path";
import { fileURLToPath } from "url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const diskStorage = multer.diskStorage({
  destination: path.join(__dirname, "../assets"),
  filename: (req, file, cb) => {
    cb(null, Date.now() + file.originalname);
  },
});

const fileUpload = multer({
  storage: diskStorage,
}).single("image");

export default fileUpload;
