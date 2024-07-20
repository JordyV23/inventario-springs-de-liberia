import React from "react";
import { useDispatch, useSelector } from "react-redux";
import { changeModalState, setCreation, writeModalTitle } from "../store";
import { Button, Modal } from "flowbite-react";
import { ModalFooterOption } from "./ModalFooterOption";
import { SpringBtn } from "./shared";

export const FormModal = ({
  children,
  label,
  icon,
  clearFunction,
  creationFunction,
  editionFunction,
  closeMaintenanceFunction = () => {}
}) => {
  const { isModalOpen, modalTitle, modalMode } = useSelector(
    (state) => state.global
  );

  const dispatch = useDispatch();

  const handleModalChange = () => {
    dispatch(changeModalState());
    dispatch(writeModalTitle(label));
    dispatch(setCreation());
    dispatch(clearFunction());
  };

  const handleSubmit = {
    C: () => creationFunction(),
    E: () => editionFunction(),
    M: () => closeMaintenanceFunction(),
  };

  return (
    <>
      <div className="container mx-auto px-2 sm:px-4 md:px-6 lg:px-8 mb-4">
        <SpringBtn
          color={"bg-SpringBlue"}
          event={() => handleModalChange()}
          label={label}
          icon={icon}
        />
      </div>
      <Modal dismissible show={isModalOpen} onClose={() => handleModalChange()}>
        <Modal.Header className="bg-SpringBlue">{modalTitle}</Modal.Header>
        <Modal.Body className="bg-white border-none">
          <div className="space-y-6">{children}</div>
        </Modal.Body>
        <Modal.Footer className="bg-white border-none">
          <ModalFooterOption type={"accept"} event={handleSubmit[modalMode]} />
          <ModalFooterOption type={"cancel"} event={handleModalChange} />
        </Modal.Footer>
      </Modal>
    </>
  );
};
