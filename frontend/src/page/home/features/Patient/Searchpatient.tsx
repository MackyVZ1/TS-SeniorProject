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

type Patient = {
  dn: string | null;
  idNo: string | null;
  titleTh: string | null;
  nameTh: string | null;
  surnameTh: string | null;
};

function Searchpatient() {
  const [patients, setPatient] = useState<Patient[]>([]);

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
    console.log(patients);
  }, []);

  return (
    <Flex direction="column" className=" gap-[42px] w-full">
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
                        <Button>
                          <InfoIcon />
                        </Button>
                        <Button variant={"destructive"}>
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
    </Flex>
  );
}

export default Searchpatient;
