import { Outlet, useLocation, useNavigate } from "react-router-dom";
import Flex from "../../components/Flex";
import Header from "./component/header/Header";
import { useEffect, useState } from "react";
import { ErrorModal } from "../../components/Modal";

function Home() {
  const nav = useNavigate();
  const location = useLocation();
  const roleName = sessionStorage.getItem("roleName");
  const token = sessionStorage.getItem("token");

  const [showModal, setShowModal] = useState(false);

  useEffect(() => {
    if (!token) {
      setShowModal(true);
      // แสดง modal 1 วินาทีแล้ว redirect
      setTimeout(() => {
        setShowModal(false);
        nav("/", { replace: true });
      }, 3000);
      return;
    } else {
      if (location.pathname === "/home") {
        if (roleName === "Administrator") {
          nav("/home", { replace: true });
        } else if (roleName === "เวชระเบียน") {
          nav("/home/addpatient", { replace: true });
        }
      }
    }
  }, [token, location.pathname, nav, roleName]);

  return (
    <Flex direction="column" className="lg:flex-row">
      <Header />
      <Flex className="w-full p-[16px] md:p-[24px] lg:p-[24px]">
        <Outlet />
      </Flex>
      {showModal && (
        <ErrorModal
          message="กรุณาเข้าสู่ระบบก่อนเข้าใช้งาน"
          isVisible={showModal}
        />
      )}
    </Flex>
  );
}

export default Home;
