import { useState } from "react";
import { useNavigate } from "react-router-dom";
import Button from "../../../../components/Button";
import Flex from "../../../../components/Flex";
import Text from "../../../../components/Text";

import DentImg from "../../../../assets/logo/dent_logo_nobackground.png";

import {
  AdduserIcon,
  HamburgerIcon,
  CloseIcon,
  LogoutIcon,
  UserSearchIcon,
  StaffManagementIcon,
  ReserveChartIcon,
} from "../../../../assets/svg/index";
import { colors } from "../../../../theme/theme";
function Header() {
  const [isActive, setActive] = useState<boolean>(false);
  const nav = useNavigate();

  const handleNavbar = () => {
    setActive(!isActive);
  };

  const handleSignout = () => {
    nav(-1);
  };

  const navbarList = [
    {
      icon: <StaffManagementIcon />,
      func: handleSignout,
      desc: "จัดการข้อมูลเจ้าหน้าที่",
    },
    {
      icon: <AdduserIcon />,
      func: handleSignout,
      desc: "ลงทะเบียนคนไข้ใหม่",
    },
    {
      icon: <UserSearchIcon />,
      func: handleSignout,
      desc: "ค้นหาคนไข้",
    },
    {
      icon: <ReserveChartIcon />,
      func: handleSignout,
      desc: "จอง/คืนชาร์ต",
    },
    {
      icon: <LogoutIcon />,
      func: handleSignout,
      desc: "ลงชื่อออก",
    },
  ];

  return (
    <>
      {/******** Mobile *********/}
      <Flex
        className={`p-[20px] w-full h-[75px] shadow-[${colors.primary}] shadow-lg
          md:h-[100px] 
          lg:hidden`}
        backgroundColor="secondary"
        alignItems="center"
        justifyContent="between"
      >
        <Flex className="gap-[6px]" alignItems="center">
          <Text medium className="text-[22px] md:text-[32px]">
            e-Chart |
          </Text>
          <Text medium className="text-[18px] md:text-[28px]">
            ยินดีต้อนรับ, username
          </Text>
        </Flex>
        <Flex
          className="p-2 rounded-xl md:w-[62px] md:h-[62px]"
          backgroundColor="primary"
          alignItems="center"
          justifyContent="center"
          onClick={handleNavbar}
        >
          <HamburgerIcon />
        </Flex>
      </Flex>

      {/******** Navbar Mobile ********/}
      <Flex
        className={`fixed top-0 left-0 w-screen h-screen bg-white/95 z-50 px-8 py-8 transition-transform duration-300 ease-in-out gap-[16px]
             ${isActive ? "-translate-x-0" : "translate-x-full"}
             `}
        direction="column"
      >
        <Flex
          onClick={handleNavbar}
          className="cursor-pointer"
          justifyContent="end"
        >
          <CloseIcon />
        </Flex>
        <Flex justifyContent="center" className="rounded-4xl bg-[#E3C4F6]">
          <img src={DentImg} alt="Logo" className="w-[150px]" />
        </Flex>
        <ul className="flex flex-col gap-[8px]">
          {navbarList.map((list, index) => (
            <li key={index}>
              <Button className="w-full rounded-xl" onClick={list.func}>
                <Flex alignItems="center" className="gap-[8px]">
                  {list.icon}
                  <Text className="md:text-[20px]">{list.desc}</Text>
                </Flex>
              </Button>
            </li>
          ))}
        </ul>
      </Flex>

      {/******** Tablet, Desktop ********/}
      <Flex
        justifyContent="between"
        backgroundColor="secondary"
        className={`hidden lg:flex px-6 py-4 w-[280px] h-screen shadow-[${colors.primary}] shadow-xl`}
        direction="column"
      >
        <Flex direction="column" className="gap-[28px]">
          <Flex
            direction="column"
            justifyContent="center"
            alignItems="center"
            textAlign="center"
            onClick={() => nav("/home")}
            className="p-5 gap-[8px] hover:cursor-pointer"
          >
            <Text
              bold
              className="text-[32px] text-shadow-sm text-shadow-black/40"
            >
              e-Chart
            </Text>
            <img
              src={DentImg}
              alt="Logo"
              className="w-[220px] rounded-[120px] bg-white"
            />
            <Text semibold className="text-[24px]">
              ยินดีต้อนรับ
              <br />
              username
            </Text>
          </Flex>
          <ul className={`flex flex-col gap-[16px] hover:cursor-pointer`}>
            {navbarList.map((list, index) => {
              if (list.desc === "ลงชื่อออก") return null;
              return (
                <li
                  key={index}
                  className="p-2 rounded-lg transition-all transform duration-200 hover:bg-[#7C22B4]"
                  onClick={handleSignout}
                >
                  <Flex className={`gap-[8px]`}>
                    {list.icon}
                    <Text medium className="text-[20px]">
                      {list.desc}
                    </Text>
                  </Flex>
                </li>
              );
            })}
          </ul>
        </Flex>
        <Flex direction="column" className="gap-[12px]">
          <Flex className="py-0.5 bg-white"></Flex>
          <Flex
            className={`p-2 rounded-lg  transition-all transform duration-200 hover:bg-[#7C22B4] hover:cursor-pointer`}
          >
            <Flex className="gap-[8px]" onClick={handleSignout}>
              <LogoutIcon />
              <Text medium className="text-[20px]">
                ลงชื่อออก
              </Text>
            </Flex>
          </Flex>
        </Flex>
      </Flex>
    </>
  );
}

export default Header;
