import { useEffect, useState } from "react";
import Flex from "../../../../../components/Flex";
import Input from "../../../../../components/Input";
import Text from "../../../../../components/Text";
import Select from "../../../../../components/Select";
import Button from "../../../../../components/Button";
import {
  ErrorModal,
  SuccessModal,
  VerifyModal,
} from "../../../../../components/Modal";
import axios from "axios";
import { AddIcon, SaveIcon } from "../../../../../assets/svg";

type Staff = {
  staffCode: string;
  license: string;
  title: "นาย" | "นางสาว" | "นาง" | "อื่น ๆ";
  firstname: string;
  lastname: string;
  username: string;
  password: string;
  role: 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12;
  sort: 0;
  type: "ไม่ระบุ";
  clinic:
    | "1"
    | "2"
    | "3"
    | "4"
    | "5"
    | "6"
    | "7"
    | "8"
    | "9"
    | "10"
    | "11"
    | "12"
    | "13"
    | "14"
    | "15"
    | "-";
};

type StaffData = {
  userId: string | null;
  fName: string;
  lName: string;
  license: string | null;
  roleName?: string | null;
  clinicName?: string | null;
  tName?: string | null;
  studentID?: string;
  roleID?: number;
  users?: string;
  passw?: string;
  sort?: number;
  type?: string;
  clinicid?: string;
};

interface Props {
  onClose: () => void;
  onUserAdded?: () => void;
  onEdit?: boolean;
  staffData?: StaffData | null;
}

function Addstaffform({ onClose, onUserAdded, onEdit, staffData }: Props) {
  const [staffCode, setStaffCode] = useState<Staff["staffCode"]>("");
  const [license, setLicense] = useState<Staff["license"]>("");
  const [title, setTitle] = useState<Staff["title"]>("นาย");
  const [firstname, setFirstname] = useState<Staff["firstname"]>("");
  const [lastname, setLastname] = useState<Staff["lastname"]>("");
  const [username, setUsername] = useState<Staff["username"]>("");
  const [password, setPassword] = useState<Staff["password"]>("");
  const [role, setRole] = useState<Staff["role"]>(1);
  const [sort, setSort] = useState<Staff["sort"]>(0);
  const [type, setType] = useState<Staff["type"]>("ไม่ระบุ");
  const [clinic, setClinic] = useState<Staff["clinic"]>("1");
  const [verifyOn, setVerifyOn] = useState<boolean>(false);
  const [modalOn, setModalOn] = useState<boolean>(false);
  const [error, setError] = useState<string>("");
  const [successMessage, setSuccessMessage] = useState<string>("");

  const titleOptions = [
    { value: "นาย", label: "นาย" },
    { value: "นางสาว", label: "นางสาว" },
    { value: "นาง", label: "นาง" },
    { value: "อื่น ๆ", label: "อื่น ๆ" },
  ];

  const roleOptions = [
    { value: 1, label: "Administrator" },
    { value: 2, label: "ระบบนัดหมาย" },
    { value: 3, label: "การเงิน" },
    { value: 4, label: "เวชระเบียน" },
    { value: 5, label: "อาจารย์" },
    { value: 6, label: "ปริญญาตรี" },
    { value: 7, label: "ระบบยา" },
    { value: 8, label: "ผู้ใช้งานทั่วไป" },
    { value: 9, label: "ปริญญาโท" },
    { value: 10, label: "RequirementDiag" },
    { value: 11, label: "หัวหน้าผู้ช่วยทันตแพทย์" },
    { value: 12, label: "ผู้ช่วยทันตแพทย์" },
  ];

  const sortOptions = [{ value: 0, label: "ไม่ระบุ" }];

  const typeOptions = [{ value: "ไม่ระบุ", label: "ไม่ระบุ" }];

  const clinincOptions = [
    { value: "1", label: "Occlusion" },
    { value: "2", label: "Oral Health Promotion" },
    { value: "3", label: "Periodontic" },
    { value: "4", label: "Operative" },
    { value: "5", label: "Endodontic" },
    { value: "6", label: "Prosthodontic" },
    { value: "7", label: "Oral Surgery" },
    { value: "8", label: "Oral Diagnosis" },
    { value: "9", label: "Orthodontic" },
    { value: "10", label: "Pedodontic" },
    { value: "11", label: "บริการในเวลาราชการ" },
    { value: "12", label: "Oral Radiology" },
    { value: "13", label: "คลินิกพิเศษ" },
    { value: "14", label: "บัณฑิตศึกษา" },
    { value: "15", label: "รากเทียม" },
    { value: "-", label: "ไม่ระบุ" },
  ];

  const handleModal = () => {
    setVerifyOn(!verifyOn);
  };

  const handleAddOrUpdateStaff = async () => {
    try {
      const token = sessionStorage.getItem("token");
      const staffPayload = {
        license: license,
        fName: firstname,
        lName: lastname,
        studentID: staffCode,
        roleID: role,
        status: 0,
        users: username,
        passw: password,
        tName: title,
        sort: sort === 0 ? null : sort,
        type: type === "ไม่ระบุ" ? null : type,
        clinicid: clinic === "-" ? null : clinic,
      };

      let response;

      if (onEdit && staffData?.userId) {
        console.log("กำลังดำเนินการอัปเดทข้อมูล...");
        response = await axios.patch(
          `http://localhost:3000/api/tbdentalrecorduser/${staffData.userId}`,
          staffPayload,
          {
            headers: {
              Authorization: `Bearer ${token}`,
            },
          }
        );
        if (response) {
          console.log("อัปเดทสำเร็จแล้ว response:", response.data); // เพิ่ม
          setVerifyOn(false);
          setError(""); // ล้าง error ก่อน
          setSuccessMessage("อัปเดทข้อมูลเจ้าหน้าที่สำเร็จ");
          console.log("ก่อนตั้งค่า modalOn เป็น true. ค่าปัจจุบัน:", modalOn); // เพิ่ม
          setModalOn(true); // ตั้งค่าเป็น true
          console.log("หลังตั้งค่า modalOn เป็น true. ค่าปัจจุบัน:", modalOn); // เพิ่ม
          console.log("ค่า error หลังจากล้าง:", error); // เพิ่ม

          setTimeout(() => {
            setModalOn(false);
            if (onUserAdded) {
              onUserAdded(); // เรียกใช้ onUserAdded (handleAfterEdit) ที่นี่
            }
            onClose();
          }, 1000);
        }
      } else {
        response = await axios.post(
          "http://localhost:3000/api/tbdentalrecorduser",
          staffPayload,
          {
            headers: {
              Authorization: `Bearer ${token}`,
            },
          }
        );

        if (response) {
          setVerifyOn(false);
          setError("");
          setSuccessMessage("เพิ่มเจ้าหน้าที่สำเร็จ");
          setModalOn(true);

          setTimeout(() => {
            setModalOn(false);
            if (onUserAdded) {
              onUserAdded();
            }
            onClose();
          }, 1000);
        }
      }
    } catch (e: any) {
      let errorMessage = e.response?.data?.message;
      if (errorMessage == "Firstname required.") {
        setError("กรุณากรอกชื่อ");
        console.error(errorMessage);
      } else if (errorMessage == "Role ID required.") {
        setError("กรุณากรอกตำแหน่ง");
        console.error(errorMessage);
      } else if (errorMessage == "Username required.") {
        setError("กรุณากรอกชื่อผู้ใช้");
        console.error(errorMessage);
      } else if (errorMessage == "Password required.") {
        setError("กรุณากรอกรหัสผ่าน");
        console.error(errorMessage);
      } else {
        errorMessage = "เซิร์ฟเวอร์ขัดข้อง";
        setError(errorMessage);
      }
      setVerifyOn(false);
      setModalOn(true);

      setTimeout(() => {
        setError("");
        setModalOn(false);
      }, 1000);
    }
  };

  useEffect(() => {
    if (onEdit && staffData) {
      setStaffCode(staffData.studentID || "");
      setLicense(staffData.license || "");
      setTitle((staffData.tName as Staff["title"]) || "นาย");
      setFirstname(staffData.fName || "");
      setLastname(staffData.lName || "");
      setUsername(staffData.users || "");
      setPassword(staffData.passw || ""); // ไม่โหลด password เก่า เพื่อความปลอดภัย
      setRole((staffData.roleID as Staff["role"]) || 1);
      setSort((staffData.sort as Staff["sort"]) || 0);
      setType((staffData.type as Staff["type"]) || "ไม่ระบุ");
      setClinic((staffData.clinicid as Staff["clinic"]) || "1");
    }
  }, [onEdit, staffData]);

  return (
    <>
      <Flex direction="column" justifyContent="center" className="gap-6">
        <Flex className="gap-6 w-full max-lg:flex-col">
          <Flex alignItems="center" className="gap-[16px] ">
            <Text className="min-w-[100px] text-black lg:text-[20px]">
              รหัสนิสิต
            </Text>
            <Input
              type="text"
              name="staffcode"
              value={staffCode}
              onChange={setStaffCode}
              autocomplete="off"
              placeholder="68xxxxxx"
              className="border-[3px] border-[#A861D4] rounded-[6px] w-full"
            />
          </Flex>
          <Flex alignItems="center" className="gap-[16px]">
            <Text className="min-w-[120px] md:min-w-[200px] text-black lg:text-[20px]">
              เลขที่ใบประกอบวิชาชีพ
            </Text>
            <Input
              type="text"
              name="license"
              value={license}
              onChange={setLicense}
              autocomplete="off"
              placeholder="x-xxx-xxxxx-xx"
              className="border-[3px] border-[#A861D4] rounded-[6px] w-full"
            />
          </Flex>
        </Flex>
        <Flex className="gap-6 max-lg:flex-col">
          <Flex alignItems="center" className="gap-[16px]">
            <Text className="min-w-[80px] text-black lg:text-[20px]">
              คำนำหน้า
            </Text>
            <Select
              name="title"
              options={titleOptions}
              value={title}
              onChange={(e) => setTitle(e as Staff["title"])}
              className="border-[3px] border-[#A861D4] rounded-[6px] w-full"
            />
          </Flex>
          <Flex alignItems="center" className="gap-[16px]">
            <Text className="text-black lg:text-[20px]">ชื่อ</Text>
            <Input
              type="text"
              name="firstname"
              value={firstname}
              onChange={setFirstname}
              autocomplete="off"
              placeholder="ยิ่งอยู่"
              className="border-[3px] border-[#A861D4] rounded-[6px] w-full"
            />
          </Flex>
          <Flex alignItems="center" className="gap-[16px]">
            <Text className="text-black lg:text-[20px]">นามสกุล</Text>
            <Input
              type="text"
              name="lastname"
              value={lastname}
              onChange={setLastname}
              autocomplete="off"
              placeholder="ยิ่งเจริญ"
              className="border-[3px] border-[#A861D4] rounded-[6px] w-full"
            />
          </Flex>
        </Flex>
        <Flex className="gap-6 max-lg:flex-col">
          <Flex alignItems="center" className="gap-[16px]">
            <Text className="min-w-[60px] text-black lg:text-[20px]">
              ชื่อผู้ใช้
            </Text>
            <Input
              type="text"
              name="username"
              value={username}
              onChange={setUsername}
              autocomplete="username"
              placeholder="inwza007"
              className="border-[3px] border-[#A861D4] rounded-[6px] w-full"
            />
          </Flex>
          <Flex alignItems="center" className="gap-[16px]">
            <Text className="min-w-[80px] text-black lg:text-[20px]">
              รหัสผ่าน
            </Text>
            <Input
              type="password"
              name="password"
              value={password}
              onChange={setPassword}
              autocomplete="off"
              placeholder="********"
              className="border-[3px] border-[#A861D4] rounded-[6px] w-full"
            />
          </Flex>
        </Flex>
        <Flex className="gap-6 max-md:flex-col">
          <Flex alignItems="center" className="gap-[16px]">
            <Text className="text-black lg:text-[20px]">ตำแหน่ง</Text>
            <Select
              name="role"
              options={roleOptions}
              value={role}
              onChange={(e) => setRole(Number(e) as Staff["role"])}
              className="border-[3px] border-[#A861D4] rounded-[6px] w-full"
            />
          </Flex>
          <Flex alignItems="center" className="gap-[16px]">
            <Text className="text-black lg:text-[20px]">Sort</Text>
            <Select
              name="sort"
              options={sortOptions}
              value={sort}
              onChange={(e) => setSort(Number(e) as Staff["sort"])}
              className="border-[3px] border-[#A861D4] rounded-[6px] w-full"
            />
          </Flex>
        </Flex>
        <Flex className="gap-6 max-md:flex-col">
          <Flex alignItems="center" className="gap-[16px]">
            <Text className="text-black lg:text-[20px]">Type</Text>
            <Select
              name="type"
              options={typeOptions}
              value={type}
              onChange={(e) => setType(e as Staff["type"])}
              className="border-[3px] border-[#A861D4] rounded-[6px] w-full "
            />
          </Flex>
          <Flex alignItems="center" className="gap-[16px]">
            <Text className="text-black lg:text-[20px]">Clinic</Text>
            <Select
              name="clinic"
              options={clinincOptions}
              value={clinic}
              onChange={(e) => setClinic(e as Staff["clinic"])}
              className="border-[3px] border-[#A861D4] rounded-[6px] w-full"
            />
          </Flex>
        </Flex>
        <Flex justifyContent="center">
          <Button
            className="bg-[#A861D4] hover:bg-[#A861D4]/70"
            onClick={handleModal}
          >
            {onEdit ? <SaveIcon /> : <AddIcon />}
            <Text className="lg:text-[20px]">
              {onEdit ? "บันทึก" : "เพิ่มเจ้าหน้าที่"}
            </Text>
          </Button>
        </Flex>
      </Flex>

      {verifyOn == true && (
        <Flex
          className="fixed inset-0 z-50 bg-black/40"
          justifyContent="center"
          alignItems="center"
        >
          <VerifyModal
            message={onEdit ? "ยืนยันการอัปเดทข้อมูล" : "ยืนยันการเพิ่มข้อมูล"}
            onCancel={handleModal}
            onVerify={handleAddOrUpdateStaff}
          />
        </Flex>
      )}

      {modalOn && !error && (
        <SuccessModal message={successMessage} isVisible={modalOn} />
      )}
      {modalOn && !!error && <ErrorModal message={error} isVisible={modalOn} />}
    </>
  );
}

export default Addstaffform;
