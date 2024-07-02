import { faBox, faChartLine, faNewspaper, faPaperPlane, faToolbox, faUserGroup } from "@fortawesome/free-solid-svg-icons";
import { complete, privileged, restricted } from "./mapings";

export const springLinks = [
  {
    route: "/users",
    allowed: privileged,
    label: "Usuarios",
    icon: faUserGroup,
  },
  {
    route: "/promociones",
    allowed: privileged,
    label: "Promociones",
    icon: faPaperPlane,
  },
  {
    route: "/inventario",
    allowed: complete,
    label: "Inventario",
    icon: faBox,
  },
  {
    route: "/tramites",
    allowed: privileged,
    label: "Tramites",
    icon: faNewspaper,
  },
  {
    route: "/mantenimientos",
    allowed: restricted,
    label: "Mantenimientos",
    icon: faToolbox,
  },
  {
    route: "/reportes",
    allowed: restricted,
    label: "Reportes",
    icon: faChartLine,
  },
];
