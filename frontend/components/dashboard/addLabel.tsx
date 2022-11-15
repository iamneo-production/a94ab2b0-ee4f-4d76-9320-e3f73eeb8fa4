import React, { useEffect, useState } from "react";
import axios from "axios";
import {
  Modal,
  ModalOverlay,
  ModalContent,
  ModalHeader,
  ModalFooter,
  ModalBody,
  ModalCloseButton,
  Button,
  FormControl,
  FormLabel,
  useDisclosure,
  Input,
} from "@chakra-ui/react";

const AddLabel = () => {
  const { isOpen, onOpen, onClose } = useDisclosure();
  const [labelName, setLabelName] = React.useState("");
  const [labelAmt, setLabelAmt] = useState(0);
  const [currentAmt, setCurrentAmt] = useState(0);
  const [label_type, setLabel_type] = useState("");

  const baseURL = "https://tokenbalance-production.up.railway.app/api/labels/";

  // axios post request to add a new label using try catch

  const addLabel = async () => {
    const response = await axios.post(baseURL, {
      _acctn: "4567889039",
      label_name: labelName,
      labelAmt: labelAmt,
      currentAmt: currentAmt,
      label_type: label_type,
    });
    console.log(response);
  };

  const initialRef = React.useRef(null);
  const finalRef = React.useRef(null);

  return (
    <>
      <Button onClick={onOpen}>Add label</Button>

      <Modal
        initialFocusRef={initialRef}
        finalFocusRef={finalRef}
        isOpen={isOpen}
        onClose={onClose}
      >
        <ModalOverlay />
        <ModalContent>
          <ModalHeader>Create Label</ModalHeader>
          <ModalCloseButton />
          <ModalBody pb={6}>
            <FormControl>
              <FormLabel>Label Name</FormLabel>
              <Input
                value={labelName}
                onChange={(e) => setLabelName(e.target.value)}
                placeholder="Label name"
              />
              <FormLabel>Label type</FormLabel>
              <Input
                value={label_type}
                onChange={(e) => setLabel_type(e.target.value)}
                placeholder="Debit or Savings or Goal"
              />
              <FormLabel>Current Amount</FormLabel>
              <Input
                value={currentAmt}
                onChange={(e) => setCurrentAmt(e.target.value)}
                placeholder="Debit or Savings or Goal"
              />
              <FormLabel>Limit</FormLabel>
              <Input
                value={labelAmt}
                onChange={(e) => setLabelAmt(e.target.value)}
                placeholder="Debit or Savings or Goal"
              />
            </FormControl>
          </ModalBody>

          <ModalFooter>
            <Button
              onClick={() => {
                addLabel();
              }}
              colorScheme="blue"
              mr={3}
            >
              Save
            </Button>
            <Button onClick={onClose}>Cancel</Button>
          </ModalFooter>
        </ModalContent>
      </Modal>
    </>
  );
};

export default AddLabel;
