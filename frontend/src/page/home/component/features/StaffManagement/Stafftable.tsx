import { useEffect, useState } from "react";
import { DeleteIcon, EditIcon, SearchIcon } from "../../../../../assets/svg";
import Button from "../../../../../components/Button";
import Text from "../../../../../components/Text";
import axios from "axios";
import Flex from "../../../../../components/Flex";
import {
  ErrorModal,
  SuccessModal,
  VerifyModal,
} from "../../../../../components/Modal";
import Addstaff from "./Addstaff";
import Input from "../../../../../components/Input";
import Select from "../../../../../components/Select";

type Staff = {
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
  refreshTrigger?: number; // เพิ่ม prop สำหรับ trigger การรีเฟรช
  onEdit?: boolean;
}

function getPagination(current: number, total: number) {
  const delta = 2;
  const range = [];
  for (
    let i = Math.max(2, current - delta);
    i <= Math.min(total - 1, current + delta);
    i++
  ) {
    range.push(i);
  }
  if (current - delta > 2) range.unshift("...");
  if (current + delta < total - 1) range.push("...");
  range.unshift(1);
  if (total > 1) range.push(total);
  return range;
}

function Stafftable({ onClose, refreshTrigger, onEdit }: Props) {
  const [staffs, setStaffs] = useState<Staff[]>([]);
  const [page, setPage] = useState<number>(1);
  const [limit] = useState<number>(7);
  const [total, setTotal] = useState<number>(0);
  const [pageCount, setPageCount] = useState<number>(1);
  const [selectedId, setSelectedId] = useState<string | null>(null);

  const [isEditMode, setIsEditMode] = useState<boolean>(false);
  const [selectedStaff, setSelectedStaff] = useState<Staff | null>(null);

  const [verifyOn, setVerifyOn] = useState<boolean>(false);
  const [modalOn, setModalOn] = useState<boolean>(false);
  const [error, setError] = useState<string>("");

  const [keyword, setKeyword] = useState<string>("");
  const [roleFilter, setRoleFilter] = useState<number>(0);
  const roleOptions = [
    { value: 0, label: "ทั้งหมด" },
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
  const [clinicFilter, setClinicFilter] = useState<string>("0");
  const clinincOptions = [
    { value: "0", label: "ทั้งหมด" },
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
  ];

  const pagination = getPagination(page, pageCount);

  const handleModal = (userId: string | null = null) => {
    setSelectedId(userId);
    setVerifyOn(!verifyOn);
  };

  // แก้ไขฟังก์ชัน handleEdit ให้รับ staff data
  const handleEdit = (staff: Staff) => {
    setSelectedStaff(staff);
    setIsEditMode(true);
  };

  // ฟังก์ชันสำหรับปิด edit modal
  const handleCloseEdit = () => {
    setIsEditMode(false);
    setSelectedStaff(null);
  };

  // ฟังก์ชันสำหรับ refresh หลังจาก edit
  const handleAfterEdit = () => {
    staffFetch();
    handleCloseEdit();
  };

  const handleRemoveStaff = async () => {
    try {
      const token = sessionStorage.getItem("token");
      const response = await axios.delete(
        `http://localhost:3000/api/tbdentalrecorduser/${selectedId}`,
        {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        }
      );

      if (response) {
        setVerifyOn(false);
        setModalOn(true);
        setSelectedId(null);

        // ตรวจสอบว่าหลังจากลบแล้ว หน้าปัจจุบันยังมีข้อมูลหรือไม่
        const remainingItems = total - 1;
        const maxPageAfterDelete = Math.ceil(remainingItems / limit);

        // ถ้าหน้าปัจจุบันมากกว่าหน้าสูงสุดที่จะเหลือ และไม่ใช่หน้าแรก
        if (page > maxPageAfterDelete && page > 1) {
          setPage(maxPageAfterDelete || 1);
        } else {
          // รีเฟรชข้อมูลในหน้าปัจจุบัน
          staffFetch();
        }

        setTimeout(() => {
          setModalOn(false);
          onClose();
        }, 1000);
      }
    } catch (e: any) {
      let errorMessage = e.response?.data?.message;
      setError(errorMessage);
      console.error(errorMessage);

      setVerifyOn(false);
      setModalOn(true);

      setTimeout(() => {
        setError("");
        setModalOn(false);
      }, 1000);
    }
  };

  const staffFetch = async () => {
    try {
      const token = sessionStorage.getItem("token");
      const queryParams = new URLSearchParams({
        page: page.toString(),
        limit: limit.toString(),
      });
      if (keyword) {
        queryParams.append("keyword", keyword);
      }
      if (roleFilter !== 0) {
        // Add roleFilter to queryParams
        queryParams.append("roleId", roleFilter.toString());
      }
      if (clinicFilter !== "0") {
        // Add clinicFilter to queryParams
        queryParams.append("clinicId", clinicFilter);
      }

      const response = await axios.get(
        `http://localhost:3000/api/tbdentalrecorduser?${queryParams.toString()}`,
        {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        }
      );

      setStaffs(response.data.data ?? []);
      setTotal(response.data.total ?? 0);
      setPageCount(response.data.pageCount ?? 1);
    } catch (e: any) {
      let errorMessage = e.response?.data?.message;
      console.error(errorMessage);
    }
  };

  useEffect(() => {
    staffFetch();
  }, [page, limit, keyword, roleFilter, clinicFilter]);

  // เพิ่ม useEffect สำหรับรีเฟรชเมื่อมี refreshTrigger
  useEffect(() => {
    if (refreshTrigger) {
      staffFetch();
    }
  }, [refreshTrigger]);

  return (
    <>
      <Flex className="gap-4">
        <Flex
          alignItems="center"
          className="p-2 border-[3px] border-[#A861D4] rounded-[3px] "
        >
          <SearchIcon />
          <Input
            name="search"
            value={keyword}
            onChange={setKeyword}
            autocomplete="off"
            placeholder="ชื่อ, นามสกุล"
            className="focus:outline-none"
          />
        </Flex>
        <Select
          name="role"
          options={roleOptions}
          value={roleFilter}
          onChange={(e) => setRoleFilter(Number(e))}
          className="border-[3px] border-[#A861D4] rounded-[12px] w-full p-4"
        />
        <Select
          name="clinic"
          options={clinincOptions}
          value={clinicFilter}
          onChange={(e) => setClinicFilter(e as string)}
          className="border-[3px] border-[#A861D4] rounded-[12px] w-full p-4"
        />
      </Flex>
      <div
        className="h-full rounded-2xl border-2 border-[#A861D4] overflow-x-auto  flex justify-between flex-col"
        style={{ scrollbarWidth: "none", msOverflowStyle: "none" }}
      >
        <table className=" w-full">
          <thead>
            <tr className="text-center">
              <th className="p-4 bg-[#A861D4] ">
                <Text
                  medium
                  className="text-white text-[14px] md:text-[16px] lg:text-[20px] md:whitespace-pre-line lg:whitespace-normal"
                >
                  userId
                </Text>
              </th>
              <th className="p-4 bg-[#A861D4]">
                <Text
                  medium
                  className="text-white text-[14px] md:text-[16px] lg:text-[20px]"
                >
                  ชื่อ - นามสกุล
                </Text>
              </th>
              <th className="p-4 bg-[#A861D4]">
                <Text
                  medium
                  className="text-white text-[14px] md:text-[16px] lg:text-[20px]"
                >
                  เลขใบประกอบวิชาชีพ
                </Text>
              </th>
              <th className="p-4 bg-[#A861D4]">
                <Text
                  medium
                  className="text-white text-[14px] md:text-[16px] lg:text-[20px]"
                >
                  ตำแหน่ง
                </Text>
              </th>
              <th className="p-4 bg-[#A861D4]">
                <Text
                  medium
                  className="text-white text-[14px] md:text-[16px] lg:text-[20px]"
                >
                  คลินิก
                </Text>
              </th>
              <th className="p-4 bg-[#A861D4] w-[40px] ">
                <Text
                  medium
                  className="text-white text-[14px] md:text-[16px] lg:text-[20px]"
                >
                  {" "}
                </Text>
              </th>
            </tr>
          </thead>
          <tbody>
            {staffs.map((staff, index) => (
              <tr
                key={index}
                className={`${index % 2 === 0 ? "bg-purple-100" : "bg-white"}`}
              >
                <td className="p-4 text-center">
                  <Text
                    medium
                    className=" text-[12px] md:text-[16px] lg:text-[18px] xl:text-[20px]"
                  >
                    {staff.userId || "-"}
                  </Text>
                </td>
                <td>
                  <Text className=" text-[12px] md:text-[16px] lg:text-[18px] xl:text-[20px]">
                    {staff.tName}
                    {staff.fName} {staff.lName}
                  </Text>
                </td>
                <td className="text-center">
                  <Text className=" text-[12px] md:text-[16px] lg:text-[18px] xl:text-[20px]">
                    {staff.license || "-"}
                  </Text>
                </td>
                <td>
                  <Text className=" text-[12px] md:text-[16px] lg:text-[18px] xl:text-[20px]">
                    {staff.roleName || "-"}
                  </Text>
                </td>
                <td className="text-center">
                  <Text className=" text-[12px] md:text-[16px] lg:text-[18px] xl:text-[20px]">
                    {staff.clinicName || "-"}
                  </Text>
                </td>
                <td className="text-center p-4 flex gap-3">
                  <Button
                    className="w-[46px] h-[44px] rounded-xl bg-[#DEA344] hover:bg-[#DEA344]/70"
                    onClick={() => handleEdit(staff)}
                  >
                    <EditIcon />
                  </Button>
                  <Button
                    className="w-[46px] h-[44px] rounded-xl bg-[#C41F1F] hover:bg-[#C41F1F]/70"
                    onClick={() => handleModal(staff.userId)}
                  >
                    <DeleteIcon />
                  </Button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
        <div className="flex justify-center gap-2 py-2  items-center select-none lg:mb-4">
          <Button
            disabled={page === 1}
            onClick={() => setPage(1)}
            className={`bg-white  text-xl w-10 h-10 rounded-full disabled:opacity-50 disabled:cursor-default hover:bg-gray-200 ${
              page === 1 && "hover:bg-white"
            }`}
          >
            <Text className="text-black">{"<<"}</Text>
          </Button>
          <Button
            disabled={page === 1}
            onClick={() => setPage(page - 1)}
            className={`bg-white  text-xl w-10 h-10 rounded-full disabled:opacity-50 disabled:cursor-default hover:bg-gray-200 ${
              page === 1 && "hover:bg-white"
            }`}
          >
            <Text className="text-black">{"<"}</Text>
          </Button>
          {pagination.map((p, idx) =>
            p === "..." ? (
              <span key={idx} className="px-2 py-1 text-gray-400">
                ...
              </span>
            ) : (
              <Button
                key={p}
                onClick={() => setPage(Number(p))}
                className={`w-10 h-10 rounded-full text-xl ${
                  page === p
                    ? "bg-[#7C22B4] text-white rounded-[84px]"
                    : "bg-white text-[#AFAFAF] hover:bg-gray-200"
                }`}
                disabled={page === p}
              >
                <Text className={page === p ? "text-white" : "text-[#AFAFAF]"}>
                  {p}
                </Text>
              </Button>
            )
          )}
          <Button
            disabled={page === pageCount}
            onClick={() => setPage(page + 1)}
            className={`bg-white w-10 h-10 rounded-full text-xl  disabled:opacity-50 disabled:cursor-default hover:bg-gray-200 ${
              page === pageCount && "hover:bg-white"
            }`}
          >
            <Text className="text-black">{">"}</Text>
          </Button>
          <Button
            disabled={page === pageCount}
            onClick={() => setPage(pageCount)}
            className={`bg-white  text-xl w-10 h-10 rounded-full disabled:opacity-50 disabled:cursor-default hover:bg-gray-200 ${
              page === pageCount && "hover:bg-white"
            }`}
          >
            <Text className="text-black">{">>"}</Text>
          </Button>
        </div>
      </div>

      {isEditMode && selectedStaff && (
        <Addstaff
          onClose={handleCloseEdit}
          onUserAdded={handleAfterEdit}
          onEdit={true}
          staffData={selectedStaff}
        />
      )}

      {verifyOn == true && (
        <Flex
          className="fixed inset-0 z-50 bg-black/40"
          justifyContent="center"
          alignItems="center"
        >
          <VerifyModal
            message="ยืนยันการลบข้อมูล"
            onCancel={() => handleModal()}
            onVerify={handleRemoveStaff}
          />
        </Flex>
      )}

      {modalOn && !error && (
        <SuccessModal message="ลบข้อมูลเจ้าหน้าที่สำเร็จ" isVisible={modalOn} />
      )}
      {modalOn && !!error && <ErrorModal message={error} isVisible={modalOn} />}
    </>
  );
}

export default Stafftable;
