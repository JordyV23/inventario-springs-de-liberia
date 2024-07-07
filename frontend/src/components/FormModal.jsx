import React from "react";
import { useDispatch, useSelector } from "react-redux";
import { changeModalState } from "../store";
import { Button, Modal } from "flowbite-react";
import { ModalFooterOption } from "./ModalFooterOption";
import { SpringBtn } from "./shared";
import { faUserPlus } from "@fortawesome/free-solid-svg-icons";

export const FormModal = () => {
  const { isModalOpen } = useSelector((state) => state.global);

  const dispatch = useDispatch();

  const handleModalChange = () => {
    dispatch(changeModalState());
  };

  return (
    <>
      <div className="container mx-auto px-2 sm:px-4 md:px-6 lg:px-8 mb-4">
        <SpringBtn
          color={"bg-SpringBlue"}
          event={() => handleModalChange()}
          label={"Agregar Usuario"}
          icon={faUserPlus}
        />
      </div>
      <Modal dismissible show={isModalOpen} onClose={() => handleModalChange()}>
        <Modal.Header className="bg-SpringBlue">Terms of Service</Modal.Header>
        <Modal.Body className="bg-white border-none">
          <div className="space-y-6">
            <p className="text-base leading-relaxed text-gray-500 ">
              With less than a month to go before the European Union enacts new
              consumer privacy laws for its citizens, companies around the world
              are updating their terms of service agreements to comply.
            </p>
            <p className="text-base leading-relaxed text-gray-500">
              The European Union’s General Data Protection Regulation (G.D.P.R.)
              goes into effect on May 25 and is meant to ensure a common set of
              data rights in the European Union. It requires organizations to
              notify users as soon as possible of high-risk data breaches that
              could personally affect them.
            </p>
          </div>
        </Modal.Body>
        <Modal.Footer className="bg-white border-none">
          <ModalFooterOption type={"accept"} event={handleModalChange} />
          <ModalFooterOption type={"cancel"} event={handleModalChange} />
        </Modal.Footer>
      </Modal>
    </>
  );
};
