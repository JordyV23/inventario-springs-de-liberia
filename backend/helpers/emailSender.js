/**
 * @fileoverview Módulo para enviar correos electrónicos de publicidad.
 * @module advertisementMailer
 */

import {
  paListarAdvertisement,
  paListarUsuariosCorreos,
} from "../models/publicidad.model.js";
import moment from "moment";
import { sendMailWithNodemailer } from "./index.js";
import { promotionEmailHtmlBody } from "./emailTemplate.js";

/**
 * Envía correos electrónicos de publicidad a los usuarios.
 * @async
 * @function sendAdvertisementMail
 * @returns {Promise<void>}
 */
export const sendAdvertisementMail = async () => {
  // Obtiene la lista de promociones
  let promociones = await paListarAdvertisement();
  // Filtra las promociones que deben enviarse
  let promocionesAEnviar = obtenerDatosEnvioCorreos(promociones);
  // Obtiene la lista de usuarios y sus correos
  let usuarios = await paListarUsuariosCorreos();

  // Itera sobre las promociones a enviar
  promocionesAEnviar.map((promocion) => {
    // Itera sobre los usuarios
    usuarios.map((usuario) => {
      // Genera el cuerpo HTML del correo
      let emailBody = promotionEmailHtmlBody(
        usuario.nombreCompleto,
        promocion.descripcion,
        promocion.fechaFin
      );

      // Envía el correo electrónico
      sendMailWithNodemailer(
        usuario.correoElectronico,
        promocion.titulo,
        emailBody
      );
    });
  });
};

/**
 * Filtra y formatea los datos de las promociones para el envío de correos.
 * @function obtenerDatosEnvioCorreos
 * @param {Array} datos - Lista de promociones.
 * @returns {Array} Lista filtrada y formateada de promociones a enviar.
 */
const obtenerDatosEnvioCorreos = (datos) => {
  // Fecha de referencia (podría ser la fecha actual en un caso real)
  let day = new Date("2024-07-24");
  const hoy = moment(day);

  return (
    datos
      .filter((item) => {
        // Verifica si la promoción está activa y dentro del rango de fechas
        if (
          item.envioActivo === "Activo" &&
          hoy.isBetween(
            moment(item.fechaInicio),
            moment(item.fechaFin),
            null,
            "[]"
          )
        ) {
          // Si no es periódica, se incluye
          if (!item.envioPeriodico) {
            return true;
          }

          // Calcula los días transcurridos desde el inicio
          const fechaInicio = moment(item.fechaInicio);
          const diasDesdeInicio = hoy.diff(fechaInicio, "days");

          // Verifica si corresponde enviar hoy según el intervalo
          return diasDesdeInicio % item.intervaloDiasNotificacion === 0;
        }

        return false;
      })
      // Mapea los items filtrados al formato requerido
      .map((item) => ({
        titulo: item.titulo,
        descripcion: item.descripcion,
        fechaFin: item.fechaFin,
      }))
  );
};
