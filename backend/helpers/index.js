/**
 * Maneja errores generales y envía una respuesta de error
 * @param {Object} res - Objeto de respuesta Express
 * @param {Error} error - Objeto de error
 * @returns {Object} Respuesta JSON con estado 500 y mensaje de error
 */
export const genealError = (res, error) => {
    return res.status(500).json({
      succes: false,
      data: error.message,
    });
  };
  