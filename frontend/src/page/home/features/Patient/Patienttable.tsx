import Flex from "@/components/Flex";
import Text from "@/components/Text";
import { Input } from "@/components/ui/input";
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";
import { ScrollArea, ScrollBar } from "@/components/ui/scroll-area";
import { useEffect, useState } from "react";
import axios from "axios";
import { Button } from "@/components/ui/button";
import { DeleteIcon, InfoIcon, ReferIcon } from "@/assets/svg";
import { useNavigate } from "react-router-dom";
import { ErrorModal, SuccessModal, VerifyModal } from "@/components/Modal";

type Patient = {
  dn: string | null;
  idNo: string | null;
  titleTh: string | null;
  nameTh: string | null;
  surnameTh: string | null;
};

function Patienttable() {
  const [patients, setPatient] = useState<Patient[]>([]);
  const nav = useNavigate();

  const [verifyOn, setVerifyOn] = useState<boolean>(false);
  const [modalOn, setModalOn] = useState<boolean>(false);
  const [error, setError] = useState<string>("");
  const [selectedDN, setSelectedDN] = useState<string | null>("");

  const handleModal = (dn: string | null = null) => {
    setSelectedDN(dn);
    setVerifyOn(!verifyOn);
  };

  const handlePatientInfo = (dn: string | null) => {
    if (dn) nav(`/home/patient/${dn}`);
  };

  const handlePatientDelete = async () => {
    try {
      const token = sessionStorage.getItem("token");

      const response = await axios.delete(
        `http://localhost:3000/api/patient/${selectedDN}`,
        {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        }
      );

      console.log(response);

      if (response) {
        setVerifyOn(false);
        setModalOn(true);
        setSelectedDN(null);

        patientFetch();

        setTimeout(() => {
          setModalOn(false);
        }, 1000);
      }
    } catch (e: any) {
      let errorMessage = e.response?.data?.message;
      console.error(errorMessage);

      setVerifyOn(false);
      setModalOn(true);

      setTimeout(() => {
        setError("");
        setModalOn(false);
      }, 1000);
    }
  };

  const patientFetch = async () => {
    try {
      const token = sessionStorage.getItem("token");

      const response = await axios.get("http://localhost:3000/api/patient", {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      });
      console.log(response);
      setPatient(response.data.data ?? []);
    } catch (e: any) {
      let errorMessage = e.response?.data?.message;
      console.error(errorMessage);
    }
  };

  useEffect(() => {
    patientFetch();
  }, []);
  return (
    <>
      <Flex
        direction="column"
        alignItems="center"
        className="lg:flex-row gap-6 "
      >
        <Text className="lg:text-[24px] lg:min-w-[120px]">ค้นหาคนไข้</Text>

        <Flex className="w-full">
          <Input placeholder="DN, ชื่อ - สกุล, เลขประจำตัวประชาชน" />
        </Flex>
      </Flex>
      <Flex className="w-full">
        {/**Table */}
        <div className="border-[3px] border-[#A861D4] rounded-2xl overflow-hidden w-full">
          <ScrollArea className="h-full">
            <ScrollBar orientation="horizontal" />
            <Table>
              {/* Sticky Header */}
              <TableHeader className="bg-[#A861D4] sticky top-0 z-10">
                <TableRow className="hover:bg-transparent">
                  <TableHead className="p-4 min-w-[120px] text-center">
                    <Text className="text-white text-[24px]" semibold>
                      DN
                    </Text>
                  </TableHead>
                  <TableHead className="p-4 min-w-[200px] text-center">
                    <Text className="text-white text-[24px]" semibold>
                      เลขประจำตัวประชาชน
                    </Text>
                  </TableHead>
                  <TableHead className="p-4  min-w-[180px]">
                    <Text className="text-white text-[24px]" semibold>
                      ชื่อ - นามสกุล
                    </Text>
                  </TableHead>

                  <TableHead className="p-4 min-w-[120px]">
                    <Text> </Text>
                  </TableHead>
                </TableRow>
              </TableHeader>
              <TableBody>
                {patients.map((patient, index) => (
                  <TableRow key={index}>
                    <TableCell className="p-4 text-center">
                      <Text className="lg:text-[20px]" semibold>
                        {patient.dn}
                      </Text>
                    </TableCell>
                    <TableCell className="p-4">
                      <Text className="lg:text-[20px] text-center">
                        {patient.idNo}
                      </Text>
                    </TableCell>

                    <TableCell className="p-4 ">
                      <Text className="lg:text-[20px]">
                        {patient.titleTh}
                        {patient.nameTh} {patient.surnameTh}
                      </Text>
                    </TableCell>
                    <TableCell className="p-4">
                      <Flex justifyContent="center" className="gap-2">
                        <Button>
                          <ReferIcon />
                        </Button>
                        <Button onClick={() => handlePatientInfo(patient.dn)}>
                          <InfoIcon />
                        </Button>
                        <Button
                          variant={"destructive"}
                          onClick={() => handleModal(patient.dn)}
                        >
                          <DeleteIcon />
                        </Button>
                      </Flex>
                    </TableCell>
                  </TableRow>
                ))}
              </TableBody>
            </Table>
          </ScrollArea>
        </div>
      </Flex>

      {verifyOn == true && (
        <VerifyModal
          message="ยืนยันการลบข้อมูล"
          onCancel={() => handleModal()}
          onVerify={handlePatientDelete}
        />
      )}

      {modalOn && !error && (
        <SuccessModal message="ลบข้อมูลเจ้าหน้าที่สำเร็จ" isVisible={modalOn} />
      )}
      {modalOn && !!error && <ErrorModal message={error} isVisible={modalOn} />}
    </>
  );
}

export default Patienttable;
