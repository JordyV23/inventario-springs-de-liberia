import jsPDF from "jspdf";
import "jspdf-autotable";
import moment from "moment-timezone";

export const usePdfReport = () => {

  const generatePdf = (reportTitle, reportData) => {
    let doc = new jsPDF("landscape");

    doc.setProperties({ title: reportTitle });
    doc.addImage("images/NavLogo.png", "png", 180, 15, 60, 20);

    //*** Tabla de Titulo ***//
    doc.autoTable(getPdfTitle(reportTitle));

    //*** Tabla de datos de contacto de senara ***//
    doc.autoTable(getPdfHeader(doc));

    // //*** Tabla de datos del reporte ***//
    getDataTable(doc, reportData);

    // //*** Tabla de data de quien generó el reporte ***//
    getReportMetadata(doc);

    doc.output("dataurlnewwindow");
  };

  /**
   * Genera el titulo para un documento PDF.
   * @param {String} reporteTitledoc - Una cadena para titulo.
   */
  const getPdfTitle = (reporteTitle) => {
    return {
      body: [
        [
          {
            content: reporteTitle,
            styles: {
              align: "left",
              fontSize: 15,
              font: "Helvetica",
              fontStyle: "bold",
              cellPadding: { top: 4 },
              textColor: "#000000",
            },
          },
        ],
      ],
      theme: "plain",
    };
  };

  /**
   * Genera el encabezado para un documento PDF.
   * @param {Object} doc - Un objeto que representa el documento PDF.
   */
  const getPdfHeader = (doc) => {
    return {
      body: [
        ["Springers Real State"],
        // ["Cédula Jurídica: "],
        // ["Direccion"],
        ["Liberia, Guanacaste"],
        // ["Teléfono: "],
        // ["Email: "],
      ],
      theme: "plain",
      tableWidth: "auto",
      columnStyles: {
        0: {
          align: "left",
          cellWidth: "wrap",
          cellPadding: { top: 0, right: 2, bottom: 1, left: 0 },
        },
      },
      bodyStyles: {
        textColor: "#000000",
        align: "right",
        fontSize: 8,
      },
      // Calcula a partir de donde comienza este reporte
      startY: doc.lastAutoTable.finalY,
    };
  };

  /**
   * Genera la tabla con los datos.
   * @param {Object} doc - Un objeto que representa el documento PDF.
   * @param {Object} reportData - Un objeto que representa toda la informacion del reporte.
   */
  const getDataTable = (doc, reportData) => {
    // Extrae los headers de la tabla
    let dataHeaders = Object.keys(reportData[0]);

    // Extrae los datos a mostrar en el reporte
    let dataToShow = reportData.map((data) => Object.values(data));

    //*** Tabla de Informacion del reporte ***//
    doc.autoTable({
      head: [dataHeaders],
      body: dataToShow,
      headStyles: {
        fillColor: "#cecece",
        textColor: "#000000",
        align: "left",
        fontSize: 9,
        font: "Helvetica",
        fontStyle: "Bold",
        //cellPadding: { top: 1, right: 2, bottom: 1, left: 0 }
      },
      bodyStyles: {
        textColor: "#000000",
        align: "left",
        fontSize: 8,
        lineColor: "#6b7280",
      },
      theme: "striped",
      tableLineColor: [255, 255, 255],
      tableLineWidth: 0.4,
      cellPadding: 0,
      startY: doc.lastAutoTable.finalY + 5,
    });
  };

  /**
   * Genera la metadata del usuario que genera el reporte.
   * @param {Object} doc - Un objeto que representa el documento PDF.
   * @param {string} UserLogedName - Nombre del usuario que genera el reporte.
   */
  const getReportMetadata = (doc, UserLogedName = "") => {
    // genera la fecha del reporte
    const fecha = moment().format("YYYY/MM/DD");
    // genera la hora del reporte
    const hora = moment().format("h:mm:ss a");

    // retorna la autotable
    return doc.autoTable({
      body: [
        [
          {
            content: "Fecha de emisión: " + fecha + " " + "a las " + " " + hora,
            styles: {
              align: "left",
            },
          },
        ],
        // [
        //   {
        //     content: "Emitido por: " + UserLogedName,
        //     styles: {
        //       align: "left",
        //     },
        //   },
        // ],
      ],
      theme: "plain",
      startY: doc.lastAutoTable.finalY + 15,
    });
  };

  return {
    generatePdf,
  };
};
