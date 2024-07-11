import React, { useEffect } from "react";
import { useActionsPromotions } from "../hooks";
import { useSelector } from "react-redux";
import { FormModal, SpringDataTable, SpringForm } from "../components";
import { clearPromotionForm, loadPromotionForm } from "../store";
import { faPlusCircle, faUserPlus } from "@fortawesome/free-solid-svg-icons";
import { promotionRegisterFields } from "../data";

export const PromotionsPage = () => {
  const {
    makeGetPromotions,
    makeCreatePromotion,
    makeUpdatePromotion,
    makeDeletePromotion,
  } = useActionsPromotions();

  const { promotions } = useSelector((state) => state.promotions);

  useEffect(() => {
    makeGetPromotions();
  }, []);

  const columnTitles = ["No.Promocion", "Titulo", "FechaInicio", "EnvioPeriodico"];

  return (
    <>
      <FormModal
        label={"Agregar Promoción"}
        icon={faPlusCircle}
        clearFunction={clearPromotionForm}
        creationFunction={makeCreatePromotion}
        editionFunction={makeUpdatePromotion}
      >
        <SpringForm fields={promotionRegisterFields} />
      </FormModal>
      <SpringDataTable
        data={promotions}
        columnTitles={columnTitles}
        editModalTitle={"Editar Promocion"}
        editFunction={loadPromotionForm}
        deleteFunction={makeDeletePromotion}
      />
    </>
  );
};
